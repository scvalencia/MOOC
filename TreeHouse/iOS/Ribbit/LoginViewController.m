//
//  LoginViewController.m
//  Ribbit
//
//  Created by Sebastián Valencia on 7/22/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>


@interface LoginViewController ()

@end

@implementation LoginViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
}


- (IBAction)login:(id)sender {
    NSString *username = [self.userNameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([username length] == 0 || [password length] == 0) {
        // Display Message
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ooops!" message:@"Make sure you enter all the fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    else {
        [PFUser logInWithUsernameInBackground:username password:password
                                        block:^(PFUser *user, NSError *error) {
                                            if (error) {
                                                NSString *errorString = [error userInfo][@"error"];
                                                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:errorString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                [alertView show];
                                            }
                                            else {
                                                [self.navigationController popToRootViewControllerAnimated:YES];
                                            }
                                        }];
    }
}
@end
