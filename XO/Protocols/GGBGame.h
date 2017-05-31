//
//  GGBGame.h
//  XO
//
//  Created by Maxim Grigoriev on 31/05/2017.
//  Copyright © 2017 Maxim Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GGBPlayer.h"
#import "GGBMove.h"


@protocol GGBGame <NSObject>

@property (nonatomic, strong, readonly) NSArray <id <GGBPlayer>> *players;
@property (nonatomic, strong, readonly) id <GGBPlayer> currentPlayer;
@property (nonatomic, strong, readonly) NSArray <id <GGBMove>> *gameHistory;

- (BOOL)startGameWithPlayers:(NSArray <id <GGBPlayer>> *)players;
- (BOOL)newMove:(id <GGBMove>)gameMove;


@end
