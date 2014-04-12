//
//  STXOGamePlay.m
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import "STXOGamePlay.h"

@implementation STXOGamePlay

@synthesize playerX = _playerX;
@synthesize playerO = _playerO;
@synthesize field = _field;

+ (STXOGamePlay *)startGameWithPlayerX:(STXOPlayer *)pX playerO:(STXOPlayer *)pO {
    
    STXOGamePlay *gamePlay = [[STXOGamePlay alloc] init];
    [gamePlay playerO:pO];
    [gamePlay playerX:pX];

    [gamePlay field:[STXOField initWithHCount:3 VCount:3]];

    return gamePlay;
    
}

- (void)playerX:(STXOPlayer *)player {
    _playerX = player;
}

- (void)playerO:(STXOPlayer *)player {
    _playerO = player;
}

- (void)field:(STXOField *)field {
    _field = field;
}

@end
