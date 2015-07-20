//
//  ViewController.m
//  Matchismo
//
//  Created by krris on 25.06.2015.
//  Copyright (c) 2015 krris. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic, strong) Deck *deck;
@end

@implementation ViewController

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount changed to %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    } else {
        Card* randomCard = [[self deck] drawRandomCard];
        NSLog(@"Random card: %@", [randomCard contents]);
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:[randomCard contents] forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
}

- (Deck *) deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
