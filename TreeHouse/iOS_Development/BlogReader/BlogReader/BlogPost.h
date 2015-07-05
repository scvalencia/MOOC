//
//  BlogPost.h
//  BlogReader
//
//  Created by Sebastián Valencia on 7/15/14.
//  Copyright (c) 2014 Amit Bijlani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *imageRoute;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic) int views;
@property (nonatomic, getter = isUnread) BOOL unread;

- (id) initWithTitle:(NSString *) title;
+ (id) blogPostAndTitle:(NSString *) title;
- (NSURL*) thumbnailURL;
- (NSString *) formattedDate;

@end
