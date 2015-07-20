//
//  ViewController.m
//  Matchismo
//
//  Created by krris on 25.06.2015.
//  Copyright (c) 2015 krris. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property Deck *deck;
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
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    self.flipCount++;
}

- (Deck *) deck
{
    if (!_deck) _deck = [[Deck alloc] init];
    return _deck;
}

@end
