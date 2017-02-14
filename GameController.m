//
//  GameController.m
//  Threelow
//
//  Created by Dave Augerinos on 2017-02-08.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "GameController.h"

@implementation GameController

-(void)holdDie:(int)index {
    
    // Collect die to hold and add to set
    Dice *diceToHold = self.diceArray[index];
    
    // Toggle isHeld property
    if(diceToHold.isHeld == NO) {
        diceToHold.isHeld = YES;
        [self.heldDice addObject:diceToHold];
    }
    
    else {
        diceToHold.isHeld = NO;
        [self.heldDice removeObject:diceToHold];
    }
    
}

-(void)resetDice {
    for(Dice *currentDie in self.diceArray) {
        currentDie.isHeld = NO;
        [self.heldDice removeObject:currentDie];
    }
}

-(NSInteger)returnCurrentScore {
    
    for(Dice *currentDie in self.heldDice) {
        
        // Exclude values of 3
        if(currentDie.currentValue != 3) {
            self.currentScore += currentDie.currentValue;
        }
    }
    
    return self.currentScore;
}

-(NSString *)descriptionRolled {
    
    // Build string of rolled dice and held dice
    
    NSMutableString *rolled = [NSMutableString stringWithFormat:@"\nRolled dice: "];
    
    for(Dice *currentDie in self.diceArray) {
        NSString *appendString = [NSString stringWithFormat:@"%@ ", [currentDie description]];
        [rolled appendString:appendString];
    }

    [rolled appendString:@"\n"];
    
    return rolled;
}

-(NSString *)descriptionHeld {
    
    // Build string of rolled dice and held dice
    
    NSMutableString *held = [NSMutableString stringWithFormat:@"\nHeld dice: "];
    
    for(Dice *currentDie in self.heldDice) {
        NSString *appendString = [NSString stringWithFormat:@"%@ ", [currentDie description]];
        [held appendString:appendString];
    }
    
    [held appendString:@"\n"];
    
    return held;
}

@end
