//
//  PlayingCardViewController.m
//  Project2
//
//  Created by Glenn Axworthy on 9/24/15.
//  Copyright © 2015 Glenn Axworthy. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController

- (CardDeck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
