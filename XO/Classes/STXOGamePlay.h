//
//  STXOGamePlay.h
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STXOPlayer.h"
#import "STXOField.h"

@interface STXOGamePlay : NSObject

//typedef struct STXOMove {
//    int h;
//    int v;
//    char gamePic;
//} STXOMove;

@property (nonatomic, strong, readonly) STXOPlayer *playerX;
@property (nonatomic, strong, readonly) STXOPlayer *playerO;
@property (nonatomic, strong, readonly) STXOPlayer *currentPlayer;
@property (nonatomic, strong, readonly) STXOField *field;
@property (nonatomic, readonly) STXOCell lastMove;

+ (STXOGamePlay *)startGameWithPlayers:(NSArray *)players;

- (BOOL)move:(NSString *)move toH:(int)h V:(int)v;

@end
