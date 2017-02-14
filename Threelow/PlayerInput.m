//
//  PlayerInput.m
//  Threelow
//
//  Created by Dave Augerinos on 2017-02-08.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "PlayerInput.h"

@implementation PlayerInput

// Reads in player input and returns trimmed NSString
+(NSString *)readPlayerInput {
    
    char inputChars[255];
    
    // Read a line of input and convert to NSString
    fgets(inputChars, 255, stdin);
    NSString *inputString = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
    
    // Trim string to remove whitespace and newline characters
    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return trimmedString;
    
}

@end
