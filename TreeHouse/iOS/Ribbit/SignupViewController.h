//
//  SignupViewController.h
//  Ribbit
//
//  Created by Sebastián Valencia on 7/22/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)signup:(id)sender;

@end
