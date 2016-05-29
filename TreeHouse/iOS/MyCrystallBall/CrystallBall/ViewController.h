//
//  ViewController.h
//  CrystallBall
//
//  Created by Sebastián Valencia on 7/14/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrystallBall;

@interface ViewController : UIViewController
@property (nonatomic) int timesPressed;
@property (strong, nonatomic) IBOutlet UILabel *pressedLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) CrystallBall *crystallBall;
-(IBAction)buttonForFun;
-(void) makePrediction;

@end
