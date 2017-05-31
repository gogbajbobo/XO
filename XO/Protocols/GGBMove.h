//
//  GGBGameMove.h
//  XO
//
//  Created by Maxim Grigoriev on 31/05/2017.
//  Copyright © 2017 Maxim Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GGBPlayer.h"


@protocol GGBMove <NSObject>

@property (nonatomic, strong) id <GGBPlayer> player;


@end
