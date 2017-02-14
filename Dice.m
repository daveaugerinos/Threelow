//
//  Dice.m
//  Threelow
//
//  Created by Dave Augerinos on 2017-02-08.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self randomizeCurrentValue];
    }
    return self;
}

-(void)randomizeCurrentValue {
    
    // Generate random value between 1 and 6
    self.currentValue = arc4random_uniform(6) + 1;
    
}

-(NSString *)description {
    
    NSString *faceValue;
    
    if(self.currentValue == 1) {
        
        if(self.isHeld) {
            faceValue = @"[\u2680]";
        }
        
        else {
            faceValue = @"\u2680";
        }
        
    }
    
    else if(self.currentValue == 2) {
        
        if(self.isHeld) {
            
            faceValue = @"[\u2681]";
        }
        else {
            faceValue = @"\u2681";
        }
        
    }
    
    else if(self.currentValue == 3) {
        
        if(self.isHeld) {
            
            faceValue = @"[\u2682]";
        }
        else {
            faceValue = @"\u2682";
        }
        
    }
    
    else if(self.currentValue == 4) {
        
        if(self.isHeld) {
            
            faceValue = @"[\u2683]";
        }
        else {
            faceValue = @"\u2683";
        }
        
    }
    
    else if(self.currentValue == 5) {
        
        if(self.isHeld) {
            
            faceValue = @"[\u2684]";
        }
        else {
            faceValue = @"\u2684";
        }
        
    }
    
    else if(self.currentValue == 6) {
        
        if(self.isHeld) {
            
            faceValue = @"[\u2685]";
        }
        else {
            faceValue = @"\u2685";
        }
        
    }

    return faceValue;

}

@end
