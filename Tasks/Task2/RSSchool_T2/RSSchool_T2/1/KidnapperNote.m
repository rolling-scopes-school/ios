#import "KidnapperNote.h"

@implementation KidnapperNote
- (BOOL)checkMagazine:(NSString *)magazine note:(NSString *)note{
    NSMutableArray *words = [[NSMutableArray alloc] initWithArray:[[note lowercaseString] componentsSeparatedByString:@" "] ];
    NSInteger countOfWords = [words count] ;
    NSMutableArray *wordsInMagazine = [[NSMutableArray alloc] initWithArray:[[magazine lowercaseString] componentsSeparatedByString:@" "]];
    NSMutableArray *copyOfmag = [NSMutableArray arrayWithArray:wordsInMagazine];
    
    
    for(NSString *str in wordsInMagazine){
        [words enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull jj) {
    
            if([obj isEqualToString:str]&& [words count]!=0){
                [copyOfmag removeObject:str];
               [words removeObject:str];
            }
        }];
                }
    NSInteger countOfwordsInMag = [wordsInMagazine count];
    NSInteger checkforEmpty = [words count];
    [wordsInMagazine release];
    [words release];
    return !checkforEmpty && (countOfwordsInMag-[copyOfmag count]>= countOfWords);
}
@end
