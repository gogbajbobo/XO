//
//  STXOPlayer.h
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STXOField.h"

@interface STXOPlayer : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *gamePic;
@property (nonatomic) int gameValue;
@property (nonatomic, strong) STXOField *field;

- (STXOCell)makeMove;


@end
