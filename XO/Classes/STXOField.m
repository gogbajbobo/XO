//
//  STXOField.m
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import "STXOField.h"

#define EMPTY_CELL @""

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
                [values[h] insertObject:EMPTY_CELL atIndex:v];
            }
            
        }
        
        _values = values;
        
    }
    return _values;
    
}

- (NSMutableArray *)cells {
    
    if (!_cells) {
        
        NSMutableArray *cells = [NSMutableArray arrayWithCapacity:self.hcount];
        
        for (int h = 0; h < self.hcount; h++) {
            
            [cells insertObject:[NSMutableArray arrayWithCapacity:self.vcount] atIndex:h];
            
            for (int v = 0; v < self.vcount; v++) {
                STXOCell cell;
                cell.h = h - 1;
                cell.v = v - 1;
                cell.gamePic = (char)[EMPTY_CELL UTF8String];
                NSValue *cellValue = [NSValue valueWithBytes:&cell objCType:@encode(STXOCell)];
                [cells[h] insertObject:cellValue atIndex:v];
            }
            
        }
        
        _cells = cells;
        
    }
    return _cells;
    
}


- (BOOL)move:(NSString *)move toH:(int)h V:(int)v {
    
    if (h < self.hcount && v < self.vcount) {
        
        if ([move isEqualToString:@"X"] || [move isEqualToString:@"O"]) {
            
            if ([self.values[h][v] isEqualToString:EMPTY_CELL]) {
                
                [self.values[h] replaceObjectAtIndex:v withObject:move];
                
                STXOCell cell;
                [self.cells[h][v] getValue:&cell];
                cell.gamePic = (char)[move UTF8String];
                NSValue *cellValue = [NSValue valueWithBytes:&cell objCType:@encode(STXOCell)];
                [self.cells[h] replaceObjectAtIndex:v withObject:cellValue];
                
                return YES;

            } else {
                return NO;
            }

        } else {
            return NO;
        }

    } else {
        return NO;
    }
    
}

- (NSString *)valueForH:(int)h V:(int)v {
    
    return (v < self.vcount && h < self.hcount) ? self.values[h][v] : nil;
    
}

@end
