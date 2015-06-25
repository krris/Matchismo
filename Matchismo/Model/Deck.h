//
//  Deck.h
//  Matchismo
//
//  Created by krris on 25.06.2015.
//  Copyright (c) 2015 krris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
