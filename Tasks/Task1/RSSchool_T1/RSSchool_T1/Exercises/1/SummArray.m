#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    int summ = 0;
    
    for(NSNumber *numbers in array) {
        summ += [numbers integerValue];
    }
    
    
    
    return @(summ);
}

@end
