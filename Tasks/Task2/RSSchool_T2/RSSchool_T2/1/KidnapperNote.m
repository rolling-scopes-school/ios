#import "KidnapperNote.h"

@interface NSArray(Extended)
@end

@implementation NSArray(Extended)
-(BOOL)reduceTrueWithInitial:(BOOL)initialResult usingBlock:(BOOL(^)(BOOL result, id element))block {
    __block BOOL initial = initialResult;
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        initial = block(initial, obj);
    }];

    return initial;
}
@end

@implementation KidnapperNote

- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note {
    NSArray<NSString *> *words = [[note componentsSeparatedByString:@" "] valueForKey:@"lowercaseString"];
    NSMutableString *editableMagazine = [[[magaine lowercaseString] mutableCopy] autorelease];

    BOOL (^reduceBlock)(BOOL, id) = ^BOOL(BOOL result, id word) {
        BOOL newResult = result && [editableMagazine containsString:word];

        if (newResult) {
            NSRange range = [editableMagazine rangeOfString:word];
            [editableMagazine replaceCharactersInRange:range withString:@""];
        }

        return newResult;
    };

    return [words reduceTrueWithInitial:YES usingBlock: reduceBlock];
}

@end
