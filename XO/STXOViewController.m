//
//  STXOViewController.m
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import "STXOViewController.h"
#import "STXOGamePlay.h"

@interface STXOViewController ()

@end

@implementation STXOViewController

- (void)customViewInit {
    
    STXOPlayer *p1 = [[STXOPlayer alloc] init];
    p1.name = @"Xname";
    
    STXOPlayer *p2 = [[STXOPlayer alloc] init];
    p2.name = @"Oname";
    
    STXOGamePlay *gamePlay = [STXOGamePlay startGameWithPlayers:[NSArray arrayWithObjects:p1, p2, nil]];
    
    [gamePlay move:@"X" toH:0 V:0];
    [gamePlay move:@"X" toH:2 V:2];
    [gamePlay move:@"X" toH:2 V:0];
    [gamePlay move:@"X" toH:0 V:2];
    [gamePlay move:@"X" toH:1 V:1];
    [gamePlay move:@"X" toH:2 V:1];
    [gamePlay move:@"X" toH:1 V:2];
    
    NSLog(@"%@", gamePlay.field.values);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customViewInit];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
