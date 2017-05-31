//
//  STXOGamePlay.m
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import "STXOGamePlay.h"
#include <stdlib.h>

@implementation STXOGamePlay

@synthesize playerX = _playerX;
@synthesize playerO = _playerO;
@synthesize currentPlayer = _currentPlayer;
@synthesize you = _you;
@synthesize opp = _opp;
@synthesize field = _field;
@synthesize lastMove = _lastMove;


+ (STXOGamePlay *)startGameWithPlayers:(NSArray *)players {
    
    STXOGamePlay *gamePlay = [[STXOGamePlay alloc] init];
    
    int rnd = arc4random() % 2;
    gamePlay.playerO = [players objectAtIndex:rnd];
    gamePlay.playerX = [players objectAtIndex:1-rnd];
    gamePlay.currentPlayer = gamePlay.playerX;
    gamePlay.field = [STXOField initWithHCount:3 VCount:3];
    
    for (STXOPlayer *player in players) {
        player.field = gamePlay.field;
    }
    
    return gamePlay;
    
}

+ (STXOGamePlay *)startGameWithYou:(STXOPlayer *)you andOpp:(STXOPlayer *)opp {
    
    STXOGamePlay *gamePlay = [[STXOGamePlay alloc] init];
    
    gamePlay.you = you;
    gamePlay.opp = opp;
    
    NSArray *players = [NSArray arrayWithObjects:you, opp, nil];
    
    int rnd = arc4random() % 2;
    gamePlay.playerO = [players objectAtIndex:rnd];
    gamePlay.playerX = [players objectAtIndex:1-rnd];
//    gamePlay.currentPlayer = gamePlay.playerX;
    gamePlay.currentPlayer = gamePlay.you;
    gamePlay.field = [STXOField initWithHCount:3 VCount:3];
    
    for (STXOPlayer *player in players) {
        player.field = gamePlay.field;
    }
    
    return gamePlay;

}


- (void)setPlayerX:(STXOPlayer *)player {
    player.gamePic = @"X";
    player.gameValue = 1;
    _playerX = player;
}

- (void)setPlayerO:(STXOPlayer *)player {
    player.gamePic = @"O";
    player.gameValue = -1;
    _playerO = player;
}

- (void)setCurrentPlayer:(STXOPlayer *)currentPlayer {
    
    if (currentPlayer == self.you) {
        NSLog(@"%@", self);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"yourMove" object:self];
    } else if (currentPlayer == self.opp) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"oppsMove" object:self];
    }
    _currentPlayer = currentPlayer;
}

- (void)setYou:(STXOPlayer *)you {
    _you = you;
}

- (void)setOpp:(STXOPlayer *)opp {
    _opp = opp;
}

- (void)setField:(STXOField *)field {
    _field = field;
}

- (void)setLastMove:(STXOCell)lastMove {
    _lastMove = lastMove;
}

- (BOOL)move:(NSString *)move toH:(NSInteger)h andV:(NSInteger)v {
    
//    if ([self.field move:move toH:h V:v]) {
    
    BOOL GP = [self.field setValue:self.currentPlayer.gameValue toH:h andV:v];
    
//    NSLog(@"GP %d", GP);
    
    if (GP) {

        STXOCell lastMove;
        lastMove.h = h;
        lastMove.v = v;
        lastMove.gamePic = (char)[self.currentPlayer.gamePic UTF8String];
        self.lastMove = lastMove;
        
        NSValue *move = [NSValue valueWithBytes:&lastMove objCType:@encode(STXOCell)];
        [self.field.cells[h] replaceObjectAtIndex:v withObject:move];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"lastMove" object:self userInfo:[NSDictionary dictionaryWithObject:move forKey:@"move"]];

        self.currentPlayer = (self.currentPlayer == self.playerX) ? self.playerO : self.playerX;
        
        BOOL CM = [self checkMove];
        
//        NSLog(@"CM %d", CM);
        
        return YES;

        if (CM) {
            
            return YES;

        }
        
    }
    
    return NO;
    
}

- (BOOL)checkMove {
    
    BOOL CH = [self checkHorizontal];
    BOOL CV = [self checkVertical];
    BOOL CD = [self checkDiagonal];
    
//    NSLog(@"CH%d, CV%d, CD%d", CH, CV, CD);
    
    return (CH || CV || CD);
    
}

- (BOOL)checkHorizontal {
    
    char gamePic = self.lastMove.gamePic;
    BOOL result = YES;
    STXOCell cell;
    
    for (int i = 0; i < self.field.vcount; i++) {
        
        [self.field.cells[self.lastMove.h][i] getValue:&cell];
        result = result && (cell.gamePic == gamePic);
        
    }
    
    if (result) {
        NSLog(@"horizontal");
    }
    
    return result;
    
}

- (BOOL)checkVertical {
    
    char gamePic = self.lastMove.gamePic;
    BOOL result = YES;
    STXOCell cell;

    for (int i = 0; i < self.field.hcount; i++) {

        [self.field.cells[i][self.lastMove.v] getValue:&cell];
        result = result && (cell.gamePic == gamePic);
        
    }

    if (result) {
        NSLog(@"vertical");
    }

    return result;
    
}

- (BOOL)checkDiagonal {
    
    int h = self.lastMove.h - 1;
    int v = self.lastMove.v - 1;
    char gamePic = self.lastMove.gamePic;

    if (((abs(h) == 1) && v == 0) || ((abs(v) == 1) && h == 0)) {
        
        return NO;
        
    } else {
        
        if (v == 0 && h == 0) {
            
            BOOL result1 = YES;
            BOOL result2 = YES;
            STXOCell cell;

            for (int i = 0; i < self.field.hcount; i++) {

                [self.field.cells[i][i] getValue:&cell];
                result1 = result1 && (cell.gamePic == gamePic);
                
                [self.field.cells[i][self.field.hcount-1-i] getValue:&cell];
                result2 = result2 && (cell.gamePic == gamePic);

            }
            
            if (result1) {
                NSLog(@"+diagonal");
            }
            if (result2) {
                NSLog(@"-diagonal");
            }
            
            return result1 || result1;
            
        } else {
            
            BOOL result = YES;
            STXOCell cell;
            
            if (h * v == 1) {

                for (int i = 0; i < self.field.hcount; i++) {
                    
                    [self.field.cells[i][i] getValue:&cell];
                    result = result && (cell.gamePic == gamePic);

                }
                
                if (result) {
                    NSLog(@"+diagonal");
                }
                
            } else if (h * v == -1) {

                for (int i = 0; i < self.field.hcount; i++) {
                    
                    [self.field.cells[i][self.field.hcount-1-i] getValue:&cell];
                    result = result && (cell.gamePic == gamePic);
                    
                }
                
                if (result) {
                    NSLog(@"-diagonal");
                }

            }
            
            return result;
            
        }
        
    }
    
    return NO;
    
}

@end
