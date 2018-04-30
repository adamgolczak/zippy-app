//
//  HTTPService.h
//  zippy
//
//  Created by Adam Golczak on 30/04/2018.
//  Copyright © 2018 Adam Golczak. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onCompleteHTTP) (NSDictionary* __nullable dataDict, NSString* __nullable errMsg);

@interface HTTPService: NSObject
    @property (nonatomic, weak) NSString *zipCode;
    + (HTTPService*) sharedInstanceWithZip: (NSString*) zipCode;
    - (instancetype) initWithZipCode: (NSString*) zipCode;
    - (void) getZipInfo: (nullable onCompleteHTTP) completionHandler;
@end
