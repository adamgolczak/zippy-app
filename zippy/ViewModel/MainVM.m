//
//  MainVM.m
//  zippy
//
//  Created by Adam Golczak on 30/04/2018.
//  Copyright © 2018 Adam Golczak. All rights reserved.
//

#import "MainVM.h"
#import "HTTPService.h"

@implementation MainVM
- (id)initWithZip :(NSString*) zipFirst :(NSString*) zipSecond {

    self = [super init];
    if (self) {
        _zipFirst = zipFirst;
        _zipSecond = zipSecond;
    }
    return self;

}

- (void) fetchDetailsFromNetwork :(nullable onComplete) completionHandler {
    NSString *zipCode = [NSString stringWithFormat:@"%@-%@", _zipFirst, _zipSecond];
    
    //    MARK: I have made a singleton pattern only for educational purpuses.
    //    HTTPService *vm = [HTTPService sharedInstanceWithZip:zipCode];
    
    HTTPService *vm = [[HTTPService alloc] initWithZipCode:zipCode];
    [vm getZipInfo:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errMsg) {
        if (dataDict) {
            if (dataDict.count > 0) {
                NSMutableArray *places = [dataDict mutableArrayValueForKey:@"places"];
                NSString *city = [NSString stringWithFormat:@"%@", [places[0] objectForKey:@"place name"]];
                NSString *state = [NSString stringWithFormat:@"%@", [places[0] objectForKey:@"state"]];
                completionHandler([NSString stringWithFormat:@"%@-%@", self->_zipFirst, self->_zipSecond], [NSString stringWithFormat:@"Miasto: %@ \nWojewództwo: %@", city, state]);
            } else {
                completionHandler([NSString stringWithFormat:@"%@-%@", self->_zipFirst, self->_zipSecond], @"Brak danych dotyczących podanego kodu pocztowego");
            }
        } else if (errMsg) {
            completionHandler(@"Błąd", @"Wystąpił nieoczekiwany błąd");
        }
    }];
}

@end
