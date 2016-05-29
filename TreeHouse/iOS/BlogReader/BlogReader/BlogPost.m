//
//  BlogPost.m
//  BlogReader
//
//  Created by Sebastián Valencia on 7/15/14.
//  Copyright (c) 2014 Amit Bijlani. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (id) initWithTitle:(NSString *) title {
    self = [super init];
    
    if(self) {
        self.title = title;
        self.author = nil;
        self.imageRoute = nil;
        
    }
    
    return self;
}

+ (id) blogPostAndTitle:(NSString *) title {
    return [[self alloc] initWithTitle:title];
}

- (NSURL*) thumbnailURL {
    NSURL *toReturn = [NSURL URLWithString:self.imageRoute];
    return toReturn;
}

- (NSString *) formattedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dt = [dateFormatter dateFromString:self.date];
    [dateFormatter setDateFormat:@"EE MMM, dd"];
    return [dateFormatter stringFromDate:dt];
}

@end
