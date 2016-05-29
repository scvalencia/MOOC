//
//  main.m
//  MyFirstObjectiveCProgram
//
//  Created by turner on 9/26/13.
//  Copyright (c) 2013 treehouse. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Sphere.h"
#import "Shape.h"
#import "Circle.h"
#import "Buttom.h"
#import "Book.h"
#import "NSArray+String.h"

int main() {
    
    Shape *shape = [[Shape alloc] init];
    NSLog(@"shape area: %f", [shape area]);
    
    Circle *circle = [[Circle alloc] init];
    circle.radius = 1.0;
    NSLog(@"circle area: %f", [circle area]);
    
    Buttom *roundButtom = [[Buttom alloc] init];
    roundButtom.shape = circle;
    
    NSNumber *mike;
    mike = @45;
    NSLog(@"mike %@", mike);
    
    NSString *name = @"Sebastian ";
    NSString *last_name = @"Valencia";
    NSString *whole_name = [name stringByAppendingString:last_name];
    NSLog(@"mike %@", whole_name);
    
    NSArray *foo = [[NSArray alloc] initWithObjects:@"f", @"o", @"o", nil];
    for(NSString *string in foo) {
        NSLog(@"%@", string);
    }
    NSArray *nFoo = @[@"f", @"o", @"o"];
    for(NSString *string in nFoo) {
        NSLog(@"%@", string);
    }
    
    NSMutableArray *lots = [[NSMutableArray alloc] init];
    for(int i = 0; i < 10; i++) {
        NSNumber *itm = [[NSNumber alloc] initWithInt:i];
        lots[i] = itm;
    }
    NSLog(@"lots: %@", lots);
    
    NSDictionary *dct = [[NSDictionary alloc] initWithObjectsAndKeys:@"The cat in the hat"
                         , @"title", @"Dr. Seuss", @"Author", nil];
    dct = @{@"title" : @"100 years of solitude", @"author" : @"Garcia Marquez"};
    NSLog(@"%@", [dct objectForKey:@"author"]);
    NSLog(@"%@", dct);
    NSMutableDictionary *mutableDct = [NSMutableDictionary dictionaryWithDictionary:dct];
    [mutableDct setObject:@1967 forKey:@"year"];
    for(NSString *key in [mutableDct allKeys]) {
        NSLog(@"%@ : %@", key, [mutableDct objectForKey:key]);
    }
    
    /*
     * Shape *myShape = [[Shape alloc] init] , alloc, and init from NSObject
     * Objective-C handles memory management using reference counting (ARC)
     * when the reference count of an object is zero, it is deallocated by 
     * the OS. Besides that, clever programmer hints gives Objective-C compa-
     * rable capabilities of those of C (via properties).
     *
     * @property(nonatomic, ________), nonatomic is for threads
     *      - strong : Increases reference count, and ensures that the reference is mantained
     *      - copy : Sets RC to one, this prevent changes in the value
     *      - weak : Does not increase RC
     *      - assign : Native types
     *
     */
    
    // CATEGORIES : Neddeed to extended classes, with methods for just convenient
    //              situations, extension to classes
    
    NSArray *letters = @[@"alpha", @"bravo", @"charlie"];
    NSLog(@"%@", letters);
    NSMutableArray *cap = [[NSMutableArray alloc] init];
    for(NSString *itm in letters) {
        NSString *capitalized = [itm capitalizedString];
        [cap addObject:capitalized];
    }
    NSLog(@"%@", cap);
    
    // In order to avoid this code, we encapsulate it in a category os NSArray class
    // New_File >> iOS >> Cocoa/Touch >> Objective-C category
    
    NSLog(@"%@", [cap capitalizedString]);
    
    // Dynamic typing: id is a generic pointer
    
    NSArray *mixed = @[@23, @"tango", circle];
    for(id thing in mixed) // Discover the behavior of a type in the flight
        NSLog(@"%@", thing);
    
    id thing = nil;
    thing = @4;
    
    Book *book1 = [[Book alloc] init];
    Book *book2 = book1;
    NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef) book2));
    
    return 0;
}
