//
//  CrystallBall.h
//  CrystallBall
//
//  Created by Sebastián Valencia on 7/14/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrystallBall : NSObject {
    NSArray *_predictions;
}

@property (strong, nonatomic, readonly) NSArray *predictions;
@property (strong, nonatomic) NSArray *colors;
-(NSString*) randomPrediction;
-(UIColor*) randomColor;

@end
