#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    NSInteger sum = 0;
    
    for (NSNumber* value in array) {
        sum += [value integerValue];
    }
    
    return [@(sum) autorelease];
}

@end
