//
//  MainVM.m
//  zippy
//
//  Created by Adam Golczak on 30/04/2018.
//  Copyright © 2018 Adam Golczak. All rights reserved.
//

#import "MainVM.h"

@implementation MainVM
- (id)initWithZip :(NSString*) zipFirst :(NSString*) zipSecond {

    self = [super init];
    if (self) {
        _zipFirst = zipFirst;
        _zipSecond = zipSecond;
    }
    return self;

}

- (id)fetchDetailsFromNetwork


@end
