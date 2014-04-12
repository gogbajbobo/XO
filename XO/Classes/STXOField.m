//
//  STXOField.m
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import "STXOField.h"

@implementation STXOField

+ (STXOField *)initWithHCount:(int)hcount VCount:(int)vcount {

    STXOField *field = [[STXOField alloc] init];
    field.hcount = hcount;
    field.vcount = vcount;
    
    return field;
    
}

- (NSMutableArray *)values {
    
    if (!_values) {
        
        NSMutableArray *values = [NSMutableArray arrayWithCapacity:self.hcount];
        
        for (int h = 0; h < self.hcount; h++) {
            
            [values insertObject:[NSMutableArray arrayWithCapacity:self.vcount] atIndex:h];
            
            for (int v = 0; v < self.vcount; v++) {
                [values[h] insertObject:@"" atIndex:v];
            }
            
        }
        
        _values = values;
        
    }
    return _values;
    
}

- (BOOL)move:(NSString *)move toH:(int)h V:(int)v {
    
    if (h < self.hcount && v < self.vcount) {
        
        if ([move isEqualToString:@"X"] || [move isEqualToString:@"O"]) {
            
            [self.values[h] replaceObjectAtIndex:v withObject:move];
            return YES;

        } else {
            
            return NO;
            
        }

    } else {
        
        return NO;
        
    }
    
}

@end
