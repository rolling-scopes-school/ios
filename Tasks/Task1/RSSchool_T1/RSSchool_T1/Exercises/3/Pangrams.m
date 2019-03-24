#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    NSString* alphabetic = @"abcdefghijklmnopqrstuvwxyz";
    
    for (int i = 0; i < [alphabetic length]; i++) {
        NSString *ch = [alphabetic substringWithRange:NSMakeRange(i, 1)];
        if (![[string lowercaseString] containsString:ch]) {
            return NO;
        }
        [ch release];
    }

    return YES;
}

@end
