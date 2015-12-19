//
//  BogusCardGameViewController.m
//  Project2
//
//  Created by Glenn Axworthy on 9/24/15.
//  Copyright © 2015 Glenn Axworthy. All rights reserved.
//

#import "BogusCardGameViewController.h"
#import "ResultsViewController.h"

@interface BogusCardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) NSMutableArray *resultList;
@property (nonatomic) int score;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation BogusCardGameViewController

- (IBAction)bogusCardTouched:(id)sender
{
    int index = (int) [self.cardButtons indexOfObject:sender];
    int points = index + 1;
    self.score += points;

    UIButton *button = sender;
    UniChar suit = [button.currentTitle characterAtIndex:0];
    NSString *result = [NSString stringWithFormat:@"Chose %C for %d points\n", suit, points];
    [self.resultList insertObject:result atIndex:0];

    [self updateView];
}

- (IBAction)newGameTouched:(id)sender
{
    self.score = 0;
    [self.resultList removeAllObjects];
    [self updateView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ResultsViewController *controller = segue.destinationViewController;
    controller.results = self.resultList;
}

- (NSMutableArray *)resultList
{
    if (!_resultList)
        _resultList = [[NSMutableArray alloc] init];

    return _resultList;
}

- (void)updateView
{
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.score];
    self.resultLabel.text = [self.resultList firstObject];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateView];
}

@end
