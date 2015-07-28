//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by krris on 21.07.2015.
//  Copyright (c) 2015 krris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void) chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
