//
//  NSArray+String.m
//  MyFirstObjectiveCProgram
//
//  Created by Sebastian Valencia on 6/10/14.
//  Copyright (c) 2014 treehouse. All rights reserved.
//

#import "NSArray+String.h"

@implementation NSArray (String)
-(NSArray *) capitalizedString {
    NSMutableArray *toReturn = [[NSMutableArray alloc] init];
    for(NSString *itm in self) {
        NSString *capitalizedItem = [itm capitalizedString];
        [toReturn addObject:capitalizedItem];
    }
    return toReturn;
}
@end
