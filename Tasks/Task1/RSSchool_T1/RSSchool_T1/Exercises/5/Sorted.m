#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    value.status = NO;
    
    NSArray *tempArray = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSMutableArray *array = [tempArray mutableCopy];
    int arrayCount = [array count];
    
    //get sorted array
    NSArray* sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id n1, id n2) {
        NSNumber *first = [NSNumber numberWithInteger:[n1 integerValue]];
        NSNumber *second = [NSNumber numberWithInteger:[n2 integerValue]];
        return [first compare:second];
    }];
    
    if ([tempArray isEqualToArray:sortedArray]) {
        value.status = YES;
        return value;
    }
    
    for (int i = arrayCount - 1; i > 0; i--) {
        if ([array[i] integerValue] < [array[i - 1] integerValue]) {
            //find element to swap
            
            int j = i - 1;
            while (j >= 0 && [array[i] integerValue] < [array[j] integerValue]) {
                j--;
            }
            
            id temp = array[i];
            array[i] = array[j + 1];
            array[j + 1] = temp;
            
            if ([array isEqualToArray:sortedArray]) {
                value.status = YES;
                value.detail = [NSString stringWithFormat:@"swap %d %d", j+2, i+1];
            }
            break;
        }
    }
    
    if (!(value.status)) {
        //try to reverse
        
        // Finding the first mismatch.
        int front;
        int indexFront = 1;
        for (front = 0; front < arrayCount; front++)
        {
            if ([sortedArray[front] integerValue]!= [tempArray[front] integerValue])
            {
                //front contains first mistmatch index
                indexFront += front;
                break;
            }
        }
        
        // Finding the last mismatch.
        int back;
        int indexBack = 1;
        for (back = arrayCount - 1; back >= 0; back--)
        {
            if ([sortedArray[back] integerValue] != [tempArray[back] integerValue])
            {
                //back contains last mismatch
                indexBack += back;
                break;
            }
        }
        
        // Check if subarray is decreasing
        do
        {
            front++;
            if ([tempArray[front - 1] integerValue] < [tempArray[front] integerValue])
            {
                return value;
            }
        } while (front != back);
        
        value.status = YES;
        value.detail = [NSString stringWithFormat:@"reverse %d %d", indexFront, indexBack];
        return value;
    }
    return value;
}

@end
