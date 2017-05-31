//
//  STXOField.h
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct STXOCell {
    int h;
    int v;
    char gamePic;
    int value;
} STXOCell;

@interface STXOField : NSObject

@property (nonatomic) int hcount;
@property (nonatomic) int vcount;
@property (nonatomic, strong) NSMutableArray *cells;

+ (STXOField *)initWithHCount:(int)hcount VCount:(int)vcount;

- (BOOL)move:(NSString *)move toH:(int)h V:(int)v;
- (BOOL)setValue:(int)value toH:(int)h V:(int)v;

- (char)valueForH:(int)h V:(int)v;
- (int)intValueForH:(int)h V:(int)v;


@end
