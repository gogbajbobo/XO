//
//  GGBPlayer.h
//  XO
//
//  Created by Maxim Grigoriev on 31/05/2017.
//  Copyright © 2017 Maxim Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GGBPlayer <NSObject>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSUUID *playerId;
@property (nonatomic) NSUInteger position;

- (instancetype)playerWithName:(NSString *)name
                      playerId:(NSUUID *)playerId;

- (void)haveToMakeMove;


@end
