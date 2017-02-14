//
//  GameController.h
//  Threelow
//
//  Created by Dave Augerinos on 2017-02-08.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

// Properties
@property (nonatomic) NSMutableArray *diceArray;
@property (nonatomic) NSMutableSet *heldDice;
@property (nonatomic) NSInteger currentScore;

// Methods
-(void)holdDie:(int)index;
-(NSString *)descriptionRolled;
-(NSString *)descriptionHeld;
-(void)resetDice;
-(NSInteger)returnCurrentScore;

@end
