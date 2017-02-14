//
//  main.m
//  Threelow
//
//  Created by Dave Augerinos on 2017-02-08.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "PlayerInput.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Create dice
        Dice *die1 = [[Dice alloc] init];
        Dice *die2 = [[Dice alloc] init];
        Dice *die3 = [[Dice alloc] init];
        Dice *die4 = [[Dice alloc] init];
        Dice *die5 = [[Dice alloc] init];

        // Create Game Controller to track dice and holds
        GameController *gameController = [[GameController alloc] init];
        
        // Create dice array
        gameController.diceArray = [NSMutableArray arrayWithObjects: die1, die2, die3, die4, die5, nil];

        // Create dice held dictionary
        gameController.heldDice = [NSMutableSet set];
        
        // Check if all dice have been held
        NSUInteger numberOfHeldDice;
        
        // Boolean control for loop
        BOOL runLoop = YES;
        
        // Welcome intro
        NSLog(@"Welcome to Threelow game!\n");
        
        // Start operations loop
        while (runLoop) {
            
            // Ask player if they would like to play a game
            NSLog(@"Type roll to roll dice!\n");
            NSLog(@"Type quit to exit game.\n");
            
            // Read player answer
            NSString *inputString = [PlayerInput readPlayerInput];
            
            // Check is using wants to quit playing
            if ([inputString isEqualToString:@"quit"]) {
                printf("Thanks for playing Threelow!\n");
                runLoop = NO;
            }
            
            // Otherwise check answer
            else if ([inputString isEqualToString:@"roll"]) {
                
                // Check if all dice have been held
                numberOfHeldDice = [gameController.heldDice count];
                
                if(numberOfHeldDice == 5) {
                    NSLog(@"Round Over.\n");
                    NSLog(@"Current Score: %lu", [gameController returnCurrentScore]);
                }
                
                // Randomize unheld dice and request user pick a die to hold
                else {
                 
                    // Randomize all dice not being currently held
                    for(Dice *myDice in gameController.diceArray) {
                        
                        if(myDice.isHeld == NO) {
                            [myDice randomizeCurrentValue];
                        }
                        
                    }
                    
                    // Loop while player selects dice to hold or release from current roll
                    BOOL pickingDice = YES;
                    
                    while(pickingDice) {
                        
                        NSLog(@"%@\n", [gameController descriptionRolled]);
                        
                        NSLog(@"Enter a number [1-5] to hold or unhold a die.\n");
                        NSLog(@"Type reset to release all held dice.\n");
                        NSLog(@"Type done when finished selected dice.\n");
                      
                        // Read player answer
                        NSString *inputString = [PlayerInput readPlayerInput];
                        
                        // Break loop when done picking
                        if([inputString isEqualToString:@"done"]) {
                            
                            // Check if all dice have been held
                            numberOfHeldDice = [gameController.heldDice count];
                            
                            if(numberOfHeldDice == 5) {
                                NSLog(@"Round Over.\n");
                                NSLog(@"Current Score: %lu", [gameController returnCurrentScore]);
                            }
                            
                            pickingDice = NO;
                            
                        }
                        
                        // Reset and release all held dice if requested
                        else if([inputString isEqualToString:@"reset"]) {
                            [gameController resetDice];
                            NSLog(@"All held dice released.\n");
                            NSLog(@"Current Score: %lu", [gameController returnCurrentScore]);
                        }
                        
                        else {
                            
                            // Check for valid range of index
                            NSCharacterSet *myCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"12345"] invertedSet];
                            if([inputString  rangeOfCharacterFromSet:myCharacters].location == NSNotFound && inputString.length > 0) {
                                // Adjust user index to array index
                                int index = [inputString intValue] - 1;
                                
                                [gameController holdDie:index];
                                
                                NSLog(@"%@\n", [gameController descriptionRolled]);
                                NSLog(@"Current Score: %lu", [gameController returnCurrentScore]);
                            }
                            
                            else {
                                NSLog(@"Invalid Choice.\n");
                            }
                        }
                    }

                    
                    
                }
                
            
            }
            
            // continue in while loop
            continue;
            
        }
        
    }
    return 0;
}
