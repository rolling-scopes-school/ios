#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    
    double square = [string length];
    double sqrtValue = floor(square);
    double ceilValue = ceil(square);
    int rowCount = sqrtValue;
    int columnCount = ceilValue;
    
    if(sqrtValue * ceilValue >= [string length]) {
        rowCount = sqrtValue;
        columnCount = ceilValue;
    } else {
        rowCount = ceilValue;
        columnCount = ceilValue;
    }
    
    NSMutableArray *array = [NSMutableArray array];
    
    for(int i = 0; i < columnCount; i++) {
        for(int k = 0; k < rowCount; k++) {
            
            int position = i + k * columnCount;
            if(position >= [string length]) {
                break;
            }
            
            unichar item = [string characterAtIndex:position];
            [array addObject: [NSString stringWithFormat:@"%c", item]];
        }
        if(i != columnCount - 1) {
            [array addObject:@" "];
        }
    }
    
    return [array componentsJoinedByString:@""];
}

@end
