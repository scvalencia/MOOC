//
//  ViewController.m
//  CrystallBall
//
//  Created by Sebastián Valencia on 7/14/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#include <stdlib.h>
#include <UIKit/UIView.h>
#import "ViewController.h"
#import "CrystallBall.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.timesPressed = 0;
    self.crystallBall = [[CrystallBall alloc] init];
    /*
    UIImage *imageObject = [UIImage imageNamed:@"backgorund"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:imageObject];
    [self.view insertSubview:imageView atIndex:0];
     */
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGRect frame = self.pressedLabel.frame;
    self.pressedLabel.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonForFun {
    self.timesPressed += 1;
    self.pressedLabel.text =  [NSString stringWithFormat:@"%d : %@", self.timesPressed, [self.crystallBall randomPrediction]];
    self.pressedLabel.textColor = [self.crystallBall randomColor];
}

-(void) makePrediction {
    self.pressedLabel.text = [self.crystallBall randomPrediction];
}

#pragma mark - Touch Events

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.pressedLabel.text = nil;
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.pressedLabel.text = self.crystallBall.randomPrediction;
    
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"touches cancelled");
    
}

#pragma mark - Motion Events

-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    self.pressedLabel.text = nil;
}

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(motion == UIEventSubtypeMotionShake) {
        self.pressedLabel.text = self.crystallBall.randomPrediction;
    }
}

-(void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"motion cancelled");
}















@end
