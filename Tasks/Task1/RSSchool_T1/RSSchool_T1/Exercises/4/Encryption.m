#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    NSString* pure = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSInteger count = [pure length];
    NSInteger column = (NSInteger)ceil(sqrt(count));
    NSInteger row = (NSInteger)ceil(count / (float)column);

    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < [pure length]; i++) {
        NSString *ch = [pure substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
        [ch release];
    }
    
    NSMutableArray *encrptions = [NSMutableArray array];
    for (int i = 0; i < row; i++) {
        NSMutableArray* result = [NSMutableArray new];
        for (int j = 0; j < column; j++) {
            if ([array count] > column*i+j) {
                [result addObject:[array objectAtIndex:column*i+j]];
            }
        }
        [encrptions addObject:result];
        [result release];
    }
    
    NSString* resultStr = @"";
    for (int i = 0; i < column; i++) {
        for (int j = 0; j < row; j++) {
            if ([[encrptions objectAtIndex:j] count] > i) {
                resultStr = [resultStr stringByAppendingString:[[encrptions objectAtIndex:j] objectAtIndex:i]];
            }
        }
        if (i != column - 1) {
            resultStr = [resultStr stringByAppendingString:@" "];
        }
    }

    [pure release];
    return resultStr;
}

@end
