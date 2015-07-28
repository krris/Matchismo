//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by krris on 21.07.2015.
//  Copyright (c) 2015 krris. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic, readwrite) NSString* lastConsideration;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i ++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index threeCardsMode:(BOOL)isThreeCardsMode
{
    if (isThreeCardsMode) {
        [self chooseCardAtIndexForThreeCardsMode:index];
    } else {
        [self chooseCardAtIndex:index];
    }
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against another card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        int delta = matchScore * MATCH_BONUS;
                        self.score += delta;
                        card.matched = YES;
                        otherCard.matched = YES;
                        self.lastConsideration = [NSString stringWithFormat:@"Log: %@ + %@ = %d", card.contents, otherCard.contents, delta];
                    } else {
                        int delta = -MISMATCH_PENALTY;
                        self.score += delta;
                        otherCard.chosen = NO;
                        self.lastConsideration = [NSString stringWithFormat:@"Log: %@ + %@ = %d", card.contents, otherCard.contents, delta];
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (void)chooseCardAtIndexForThreeCardsMode:(NSUInteger)index
{
    NSLog(@"Three cards mode - to implement!");
    [self chooseCardAtIndex:index];
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return ( index < [self.cards count]) ? self.cards[index] : nil;
}

- (instancetype) init
{
    return nil;
}

@end
