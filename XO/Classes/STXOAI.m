//
//  STXOAI.m
//  XO
//
//  Created by Maxim Grigoriev on 13/04/14.
//  Copyright (c) 2014 Maxim Grigoriev. All rights reserved.
//

#import "STXOAI.h"

@implementation STXOAI

- (STXOCell)makeMove {
    
    [self fieldAnalyze];
    
    STXOCell cell;
    return cell;
    
}

- (void)fieldAnalyze {
    
    [self hAnalyze];
    [self vAnalyze];
    [self dAnalyze];
    
}

- (void)hAnalyze {
    
    for (NSArray *row in self.field.cells) {

        int sum = 0;

        for (NSValue *cellValue in row) {
            
            STXOCell cell;
            [cellValue getValue:&cell];
            
            sum += cell.value;
            
            NSLog(@"hAnalyze sum %d h%d v%d", sum, cell.h, cell.v);
            
        }
        
        sum *= self.gameValue;
        
    }
    
}

- (void)vAnalyze {
    
}

- (void)dAnalyze {
    
}

@end
