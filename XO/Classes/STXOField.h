//
//  STXOField.h
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct STXOCell {
    NSInteger h;
    NSInteger v;
    char gamePic;
    NSInteger value;
} STXOCell;

@interface STXOField : NSObject

@property (nonatomic) NSInteger hcount;
@property (nonatomic) NSInteger vcount;
@property (nonatomic, strong) NSMutableArray *cells;

+ (STXOField *)initWithHCount:(NSInteger)hcount
                       VCount:(NSInteger)vcount;

- (BOOL)move:(NSString *)move
         toH:(NSInteger)h
        andV:(NSInteger)v;

- (BOOL)setValue:(NSInteger)value
             toH:(NSInteger)h
            andV:(NSInteger)v;

- (char)valueForH:(NSInteger)h
             andV:(NSInteger)v;

- (NSInteger)intValueForH:(NSInteger)h
                     andV:(NSInteger)v;


@end
