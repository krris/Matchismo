//
//  PlayingCard.h
//  Matchismo
//
//  Created by krris on 25.06.2015.
//  Copyright (c) 2015 krris. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
