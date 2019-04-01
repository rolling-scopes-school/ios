#import "MatrixHacker.h"
// your code here

typedef id<Character> (^Injection)(NSString *name);

@interface CharacterEx : NSObject <Character>

@property (nonatomic, assign) BOOL isClone;
@property (nonatomic, assign) NSString * name;

@end

@implementation CharacterEx

+ (instancetype)createWithName:(NSString *)name isClone:(BOOL)clone {
    CharacterEx * character = [[CharacterEx new] autorelease];
    character.name = name;
    character.isClone = clone;
    return character;
}

- (BOOL)isClone { 
    return self.isClone;
}


- (NSString *)name { 
    return self.name;
}


@end

@interface MatrixHacker ()

@property (nonatomic, copy) Injection block;

@end

@implementation MatrixHacker
// your code here
- (void)injectCode:(id<Character> (^)(NSString *name))theBlock {
    self.block = theBlock;
}

- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names{
    NSMutableArray *chars = [NSMutableArray array];
    for(NSString *name in names) {
        if(self.block != nil) {
            id <Character> character = self.block(name);
            [chars addObject:character];
        }
    }
    return [[chars copy] autorelease];
}

- (void)dealloc {
    self.block = nil;
    [super dealloc];
}

@end
