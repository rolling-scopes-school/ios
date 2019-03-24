#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    NSMutableArray* matrix = [NSMutableArray new];
    NSInteger firstDiagonal = 0;
    NSInteger secondDiagonal = 0;

    for (NSString* value in array) {
        NSArray* values = [value componentsSeparatedByString:@" "];
        [matrix addObject:values];
    }

    for (int i = 0; i < [matrix count]; i++) {
        NSArray* subMatrix = [matrix objectAtIndex:i];
        for (int j = 0; j < [subMatrix count]; j++) {
            if (i == j) {
                firstDiagonal += [[subMatrix objectAtIndex: j] intValue];
                secondDiagonal += [[subMatrix objectAtIndex: [subMatrix count] - 1 - j] intValue];
            }
        }
        [subMatrix release];
    }

    if (firstDiagonal > secondDiagonal) {
        return [@(firstDiagonal - secondDiagonal) autorelease];
    } else {
        return [@(secondDiagonal - firstDiagonal) autorelease];
    }
}

@end
