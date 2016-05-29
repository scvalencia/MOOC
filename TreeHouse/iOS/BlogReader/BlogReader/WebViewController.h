//
//  WebViewController.h
//  BlogReader
//
//  Created by Sebastián Valencia on 7/15/14.
//  Copyright (c) 2014 Amit Bijlani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (strong, nonatomic) NSURL *blogPostUrl;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
