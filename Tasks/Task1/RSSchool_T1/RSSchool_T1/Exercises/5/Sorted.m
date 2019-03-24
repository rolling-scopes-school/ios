#import "Sorted.h"


@implementation ResultObject

@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    NSArray* sortArray = [string componentsSeparatedByString:@" "];

    if ([Sorted swap:sortArray]) {
        value.detail = [Sorted swap:sortArray];
    } else {
        value.detail = [Sorted reverse:sortArray];
    }
    
    value.status = value.detail != nil;

    return [value autorelease];
}

+(NSString*)reverse:(NSArray*)data {
    NSMutableArray* array = [data mutableCopy];
    NSMutableArray* reverse = [NSMutableArray new];
    NSInteger firstIndex = 0;
    NSInteger firstValue = 0;

    for (int i = 0; i < [array count]; i++) {
        if ([array count] > i + 1) {
            NSInteger first = [[array objectAtIndex:i] integerValue];
            NSInteger second = [[array objectAtIndex:i + 1] integerValue];
            if (first > second && firstIndex == 0) {
                firstIndex = i;
                firstValue = first;
            }
        }
    }

    for (int i = 0; i < [array count]; i++) {
        NSInteger first = [[array objectAtIndex:firstIndex] integerValue];
        if ([array count] > firstIndex + i) {
            NSInteger second = [[array objectAtIndex:firstIndex + i] integerValue];
            if (first > second) {
                [reverse addObject:@(second)];
            }
        }
    }
    
    [reverse addObject:@([[array objectAtIndex:firstIndex] integerValue])];
    NSRange range;
    range.length = [reverse count];
    range.location = firstIndex;
    [array removeObjectsInRange:range];

    NSArray* numbers = [NSArray arrayWithArray:reverse];
    NSArray *sorted = [numbers sortedArrayUsingSelector:@selector(compare:)];
    
    for (int i = 0; i < [sorted count]; i++) {
        [array insertObject:[sorted objectAtIndex:i] atIndex:firstIndex+i];
    }
    
    if ([reverse count] <= 3) {
        return nil;
    } else if ([Sorted isSortedArray:array]) {
        return [[NSString stringWithFormat:@"reverse %@ %@",[sorted objectAtIndex:0],@(firstValue)] autorelease];
    } else {
        return nil;
    }
}

+(NSString*)swap:(NSArray*)data {
    NSMutableArray* array = [data mutableCopy];
    NSInteger firstIndex = 0;
    NSInteger secondIndex = 0;

    for (int i = 0; i < [array count]; i++) {
        if ([array count] > i + 1) {
            NSInteger first = [[array objectAtIndex:i] integerValue];
            NSInteger second = [[array objectAtIndex:i + 1] integerValue];
            if (first > second && firstIndex == 0) {
                firstIndex = i;
            }
        }
    }
    for (int i = 0; i < [array count]; i++) {
        NSInteger first = [[array objectAtIndex:firstIndex] integerValue];
        NSInteger second = [[array objectAtIndex:i] integerValue];
            if (first < second && secondIndex == 0) {
                secondIndex = i - 1;
            }
    }
    
    [array exchangeObjectAtIndex:firstIndex withObjectAtIndex:secondIndex];
 
    if ([Sorted isSortedArray:array] || [array count] < 3) {
        if (secondIndex == 0 && [array count] == 2) {
            secondIndex = [array count] - 1;
        } else if (secondIndex == 0) {
            return nil;
        }
    } else {
        return nil;
    }
    
    return [NSString stringWithFormat:@"swap %ld %ld",firstIndex+1,secondIndex+1];
}

+(BOOL)isSortedArray:(NSArray*)array {
    for (int i = 1; i < array.count; i++) {
        if ([array[i - 1] integerValue] > [array[i] integerValue]) {
            return NO;
        }
    }
    return YES;
}

@end

