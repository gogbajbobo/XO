//
//  STXOField.h
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STXOField : NSObject

@property (nonatomic) int hcount;
@property (nonatomic) int vcount;
@property (nonatomic, strong) NSMutableArray *values;

+ (STXOField *)initWithHCount:(int)hcount VCount:(int)vcount;
- (BOOL)move:(NSString *)move toH:(int)h V:(int)v;

@end
