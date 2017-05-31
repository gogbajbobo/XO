//
//  STXOField.m
//  XO
//
//  Created by Maxim Grigoriev on 12/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import "STXOField.h"

#define EMPTY_CELL ((char)"")

@implementation STXOField

+ (STXOField *)initWithHCount:(NSInteger)hcount VCount:(NSInteger)vcount {

    STXOField *field = [[STXOField alloc] init];
    field.hcount = hcount;
    field.vcount = vcount;
    
    return field;
    
}

- (NSMutableArray *)cells {
    
    if (!_cells) {
        
        NSMutableArray *cells = [NSMutableArray arrayWithCapacity:self.hcount];
        
        for (int h = 0; h < self.hcount; h++) {
            
            cells[h] = [NSMutableArray arrayWithCapacity:self.vcount];
            
            for (int v = 0; v < self.vcount; v++) {
                
                STXOCell cell;
                cell.h = h - 1;
                cell.v = v - 1;
                cell.gamePic = EMPTY_CELL;
                cell.value = 0;
                NSValue *cellValue = [NSValue valueWithBytes:&cell objCType:@encode(STXOCell)];
                [cells[h] insertObject:cellValue atIndex:v];
                NSLog(@"cells create h%@ v%@", @(cell.h), @(cell.v));
                
            }
            
        }
        
        _cells = cells;
        
    }
    return _cells;
    
}


- (BOOL)move:(NSString *)move toH:(NSInteger)h andV:(NSInteger)v {
    
    if (h >= self.hcount || v >= self.vcount) {
        return NO;
    }
    
    if (![move isEqualToString:@"X"] && ![move isEqualToString:@"O"]) {
        return NO;
    }
    
    STXOCell cell;
    [self.cells[h][v] getValue:&cell];

    if (cell.gamePic != EMPTY_CELL) {
        return NO;
    }
    
    cell.gamePic = (char)[move UTF8String];
    NSValue *cellValue = [NSValue valueWithBytes:&cell objCType:@encode(STXOCell)];
    [self.cells[h] replaceObjectAtIndex:v withObject:cellValue];
    
    return YES;
    
}

- (BOOL)setValue:(NSInteger)value toH:(NSInteger)h andV:(NSInteger)v {

    if (h >= self.hcount || v >= self.vcount) {
        return NO;
    }
    
    STXOCell cell;
    [self.cells[h][v] getValue:&cell];

    if (cell.value != 0) {
        return NO;
    }
    
    cell.value = value;
    
    NSValue *cellValue = [NSValue valueWithBytes:&cell objCType:@encode(STXOCell)];
    [self.cells[h] replaceObjectAtIndex:v withObject:cellValue];
    
    return YES;
    
}

- (char)valueForH:(NSInteger)h andV:(NSInteger)v {
    
    STXOCell cell;
    [self.cells[h][v] getValue:&cell];
    NSLog(@"%c", cell.gamePic);
    return (v < self.vcount && h < self.hcount) ? cell.gamePic : (char)"";
    
}

- (NSInteger)intValueForH:(NSInteger)h andV:(NSInteger)v {

    STXOCell cell;
    [self.cells[h][v] getValue:&cell];

    return cell.value;
    
//    char value = [self valueForH:h V:v];
//
//    if (strncmp(&value, "X", 1)) {
//        return 1;
//    } else if (strncmp(&value, "O", 1)) {
//        return -1;
//    } else {
//        return 0;    
//    }
    
}

@end
