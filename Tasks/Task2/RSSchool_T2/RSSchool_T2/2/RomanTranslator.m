#import "RomanTranslator.h"

@implementation RomanTranslator
// your code here

- (NSString *)romanFromArabic:(NSString *)arabicString {
    NSDictionary *romanToArabicDictionary = @{@(1):@"I", @(5):@"V", @(10):@"X", @(50):@"L", @(100):@"C", @(500):@"D", @(1000):@"M"};
    NSMutableString *romanString = [[[NSMutableString alloc] init] autorelease];
    int number = [arabicString intValue];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    NSArray *arrayFromKeys = [romanToArabicDictionary.allKeys sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    while (number != 0) {
        for (NSNumber *element in arrayFromKeys) {
            if (number - [element intValue] >= 0) {
                [romanString appendString:romanToArabicDictionary[element]];
                number -= [element intValue];
                break;
            }
            else if (number - [element intValue] + [[self makeKey:element] intValue] >= 0) {
                [romanString appendString:romanToArabicDictionary[[self makeKey:element]]];
                [romanString appendString:romanToArabicDictionary[element]];
                number -= [element intValue] - [[self makeKey:element] intValue];
                break;
            }
        }
    }
    
    return romanString;
}

- (NSString *)arabicFromRoman:(NSString *)romanString {
    NSDictionary *arabicToRomanDictionary = @{@"I":@(1), @"V":@(5), @"X":@(10), @"L":@(50), @"C":@(100), @"D":@(500), @"M":@(1000)};
    NSArray *arrayFromString = [self makeArrayFromRoman:romanString];
    int romanNumber = 0;
    for (NSString *element in arrayFromString) {
        if (element.length == 1) {
            romanNumber += [[arabicToRomanDictionary valueForKey:element] integerValue];
        }
        else {
            romanNumber += [[arabicToRomanDictionary valueForKey:[NSString stringWithFormat:@"%c", [element characterAtIndex:1]]] integerValue] - [[arabicToRomanDictionary valueForKey:[NSString stringWithFormat:@"%c", [element characterAtIndex:0]]] integerValue];
        }
    }
    return [NSString stringWithFormat:@"%d", romanNumber];
}

- (NSNumber *) makeKey: (NSNumber *) element {
    if ([element isEqualToNumber:@(1000)] || [element isEqualToNumber:@(500)]) {
        return @(100);
    }
    else if ([element isEqualToNumber:@(100)] || [element isEqualToNumber:@(50)]) {
        return @(10);
    }
    else {
        return @(1);
    }
}

- (NSArray *)makeArrayFromRoman: (NSString *) romanString {
    NSMutableArray *array = [NSMutableArray array];
    for (int i  = (int)romanString.length - 1; i >= 0; i--) {
        if (i == 0) {
            [array addObject:[NSString stringWithFormat:@"%c", [romanString characterAtIndex:i]]];
            break;
        }
        NSString *string = [romanString substringWithRange:NSMakeRange(i - 1, 2)];
        if ([romanString characterAtIndex:i] == 'V' || [romanString characterAtIndex:i] == 'X') {
            NSString *element = [self stringToArray:'I' string:string];
            [array addObject:element];
            if (element.length == 2) {
                i--;
            }
        }
        else if ([romanString characterAtIndex:i] == 'L' || [romanString characterAtIndex:i] == 'C') {
            NSString *element = [self stringToArray:'X' string:string];
            [array addObject:element];
            if (element.length == 2) {
                i--;
            }
        }
        else if ([romanString characterAtIndex:i] == 'D' || [romanString characterAtIndex:i] == 'M') {
            NSString *element = [self stringToArray:'C' string:string];
            [array addObject:element];
            if (element.length == 2) {
                i--;
            }
        }
        else {
            [array addObject:[NSString stringWithFormat:@"%c", [romanString characterAtIndex:i]]];
        }
    }
    return [[array copy] autorelease];
}

- (NSString *) stringToArray: (unichar) character string:(NSString *) string {
    if ([string characterAtIndex:0] == character) {
        return string;
    }
    else {
        return [NSString stringWithFormat:@"%c", [string characterAtIndex:1]];
    }
}

@end
