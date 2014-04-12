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

@property (nonatomic, strong, readonly) STXOPlayer *playerX;
@property (nonatomic, strong, readonly) STXOPlayer *playerO;
@property (nonatomic, strong, readonly) STXOField *field;

+ (STXOGamePlay *)startGameWithPlayerX:(STXOPlayer *)pX playerO:(STXOPlayer *)pO;

@end
