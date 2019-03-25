#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    
    int diagonalSumOne = 0;
    int diagonaleSumTwo = 0;
    int diagonalPositionOne = 0;
    int diagonalPositionTwo = [array count] - 1;
    
    
    for(NSString *str in array) {
        NSArray *line = [str componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        diagonalSumOne += [line[diagonalPositionOne]intValue];
        diagonalPositionOne += 1;
        
        diagonaleSumTwo += [line[diagonalPositionTwo] integerValue];
        diagonalPositionTwo -= 1;
        
        
        
    }
    
    return @(abs(diagonalSumOne - diagonaleSumTwo));
}

@end
