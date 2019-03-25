#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    NSArray *alphabetLetters = [@"a b c d e f g h j k l m n o p q r s t u v w x y z" componentsSeparatedByString:@" "];
    NSString *lowerCaseString = [[NSString alloc] initWithString:[[string stringByReplacingOccurrencesOfString:@" " withString:@""] lowercaseString]];
    
    for (NSString *str in alphabetLetters) {
        if ([lowerCaseString rangeOfString:str].location == NSNotFound) {
            return NO;
        }
    }
    return YES;
}

@end
