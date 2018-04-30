//
//  MainVC.m
//  zippy
//
//  Created by Adam Golczak on 30/04/2018.
//  Copyright © 2018 Adam Golczak. All rights reserved.
//

#import "MainVC.h"
#import "MainVM.h"

@interface MainVC ()

@property (nonatomic, weak) IBOutlet UITextField *zipOneField;
@property (nonatomic, weak) IBOutlet UITextField *zipTwoField;
@property (nonatomic, weak) IBOutlet UIButton *zipBtn;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    MainVM *vm = [[MainVM alloc] initWithZip:_zipOneField.text :_zipTwoField.text];
}

@end
