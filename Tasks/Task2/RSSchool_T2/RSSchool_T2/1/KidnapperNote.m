#import "KidnapperNote.h"

@implementation KidnapperNote
- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note{
    NSArray *words = [[note lowercaseString] componentsSeparatedByString:@" "];
    NSMutableArray *magazin = [[magaine lowercaseString]componentsSeparatedByString:@" "];
    for(NSString *str in words){
        [magazin enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isEqualToString:str]){
                [magazin removeObject:str];
            }
        }];
                }
    
    

    return true;
}
@end
