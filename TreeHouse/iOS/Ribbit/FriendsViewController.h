//
//  LoginViewController.m
//  Ribbit
//
//  Created by Sebastián Valencia on 7/22/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FriendsViewController : UITableViewController

@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSArray *friends;

@end
