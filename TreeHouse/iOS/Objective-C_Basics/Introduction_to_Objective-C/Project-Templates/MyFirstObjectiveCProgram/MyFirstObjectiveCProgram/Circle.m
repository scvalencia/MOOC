//
//  Circle.m
//  MyFirstObjectiveCProgram
//
//  Created by Sebastian Valencia on 6/10/14.
//  Copyright (c) 2014 treehouse. All rights reserved.
//

#import "Circle.h"

@implementation Circle
-(float) area {
    return M_PI * self.radius * self.radius;
}
-(NSString *) description { // As Java's toString
    return [NSString stringWithFormat:@"Radius : %f.", self.radius];
}

@end
