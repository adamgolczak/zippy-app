//
//  HTTPService.m
//  zippy
//
//  Created by Adam Golczak on 30/04/2018.
//  Copyright © 2018 Adam Golczak. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "http://api.zippopotam.us/"
#define URL_COUNTRY "pl"

@implementation HTTPService

+ (HTTPService*) sharedInstanceWithZip: (NSString*) zipCode {
    static HTTPService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HTTPService alloc] initWithZipCode:zipCode];
    });
    
    return sharedInstance;
}

- (instancetype) initWithZipCode: (NSString*) zipCode {
    self = [super init];
    if (self) {
        _zipCode = zipCode;
    }
    
    return self;
}

- (void) getZipInfo :(nullable onCompleteHTTP) completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s/%@", URL_BASE, URL_COUNTRY, _zipCode]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSError *err;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, err.debugDescription);
            }
        }
    }] resume];
}

@end
