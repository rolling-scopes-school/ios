#import "MatrixHacker.h"
// your code here
@implementation MatrixHacker
id<Character> (^_Block)(NSString *name);



-(void)injectCode:(id<Character> (^)(NSString *name))theBlock {
    _Block = theBlock;
}
- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names{
    NSMutableArray<id<Character>> *array = [[NSMutableArray<id<Character>> alloc] init];
    for (NSString *name in names)
    {
        id<Character> сharacter = _Block(name);
        if ([сharacter.class respondsToSelector:@selector(createWithName:isClone:)]) {
            if ([name isEqualToString:@"Neo"]){
                сharacter = [[сharacter class] createWithName:name isClone:NO];
            } else {
                сharacter = [[сharacter class] createWithName:name isClone:YES];
            }
            [array addObject:сharacter];
        }
    }
    NSArray<id<Character>> *unmmutableCopy = [array copy];
    [array release];
    return [unmmutableCopy autorelease];
    }


@end
