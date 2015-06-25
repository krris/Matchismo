//
//  Card.m
//  Matchismo
//
//  Created by krris on 25.06.2015.
//  Copyright (c) 2015 krris. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
