#import "KidnapperNote.h"

@implementation KidnapperNote
// your code here

- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note {
    NSString *lowerCaseMagazine = [magaine lowercaseString];
    NSString *lowerCaseNote = [note lowercaseString];
    NSArray *magazineArray = [lowerCaseMagazine componentsSeparatedByString:@" "];
    NSArray *noteArray = [lowerCaseNote componentsSeparatedByString:@" "];
    
    if ([self compareArray:noteArray withArray:magazineArray]) {
        return YES;
    }
    return NO;;
}

- (BOOL) compareArray: (NSArray *) array1 withArray: (NSArray *) array2 {
    NSMutableArray *newArray = [array2 mutableCopy];
    for (NSString *string1 in array1) {
        for (int i = 0; i < newArray.count; i++) {
            if ([string1 isEqualToString:(NSString *) newArray[i]]){
                [newArray removeObjectAtIndex:i];
                i--;
                break;
            }
            else if (i == newArray.count -1) {
                [newArray release];
                return NO;
            }
        }
    }
    [newArray release];
    return YES;
}

@end
