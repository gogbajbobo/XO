//
//  STXOViewController.m
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import "STXOViewController.h"
#import "STXOField.h"

@interface STXOViewController ()

@property (nonatomic, strong) STXOField *field;

@end

@implementation STXOViewController

- (void)customViewInit {
    
    STXOField *field = [STXOField initWithHCount:3 VCount:3];
    
    [field move:@"O" toH:0 V:0];
    [field move:@"X" toH:1 V:1];
    [field move:@"X" toH:1 V:2];
    [field move:@"F" toH:2 V:2];
    [field move:@"X" toH:4 V:5];
        
    NSLog(@"%@", field.values);
    
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
