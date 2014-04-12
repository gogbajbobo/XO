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
    
    STXOPlayer *pX = [[STXOPlayer alloc] init];
    pX.name = @"Xname";
    
    STXOPlayer *pO = [[STXOPlayer alloc] init];
    pO.name = @"Oname";
    
    STXOGamePlay *gamePlay = [STXOGamePlay startGameWithPlayerX:pX playerO:pO];
    
    STXOField *field = gamePlay.field;
    
    [field move:@"O" toH:0 V:0];
    [field move:@"X" toH:1 V:1];
    [field move:@"X" toH:1 V:2];
    [field move:@"F" toH:2 V:2];
    [field move:@"X" toH:4 V:5];
        
    NSLog(@"%@", field.values);
    NSLog(@"00 %@", [field valueForH:0 V:0]);
    NSLog(@"01 %@", [field valueForH:0 V:1]);
    NSLog(@"45 %@", [field valueForH:4 V:5]);
    
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
