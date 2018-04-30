//
//  MainVM.h
//  zippy
//
//  Created by Adam Golczak on 30/04/2018.
//  Copyright © 2018 Adam Golczak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainVM : NSObject
    @property (nonatomic, weak) NSString *zipFirst;
    @property (nonatomic, weak) NSString *zipSecond;
    - (id)initWithZip:(NSString *)zipFirst :(NSString *)zipSecond;
@end
