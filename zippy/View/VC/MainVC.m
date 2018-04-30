//
//  MainVC.m
//  zippy
//
//  Created by Adam Golczak on 30/04/2018.
//  Copyright © 2018 Adam Golczak. All rights reserved.
//

#import "MainVC.h"
#import "MainVM.h"
#import "HTTPService.h"

@interface MainVC()
    @property (nonatomic, weak) IBOutlet UITextField *zipOneField;
    @property (nonatomic, weak) IBOutlet UITextField *zipTwoField;
    @property (nonatomic, weak) IBOutlet UIButton *zipBtn;
@end

@implementation MainVC

- (void) viewDidLoad {
    [super viewDidLoad];
    [[_zipBtn layer] setCornerRadius:5.0];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void) dismissKeyboard {
    [[self view] endEditing:true];
}

- (void) displayAlert: (NSString*)title :(NSString*)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:action];
    [self presentViewController:alertController animated:true completion:nil];
}

- (IBAction) onCheckBtnTap:(id)sender {
    if ((int)_zipOneField.text.length == 2 && (int)_zipTwoField.text.length == 3) {
        MainVM *vm = [[MainVM alloc] initWithZip:_zipOneField.text :_zipTwoField.text];
        [vm fetchDetailsFromNetwork:^(NSString * _Nullable title, NSString * _Nullable message) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self displayAlert:title :message];
            });
        }];
    } else {
        [self displayAlert:@"Błąd" :@"Nieprawidłowy format kodu pocztowego"];
    }
}

@end
