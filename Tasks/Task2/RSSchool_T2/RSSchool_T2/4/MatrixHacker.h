#import <Foundation/Foundation.h>
/*
 Agent Smith is taking over the Matrix, turning everyone into his clones.
 Luckily, Neo hacked into the system and is able to inject arbitrary code.
 Turned out the Matrix is written in Objective-C, so he needs your help.

 You need to implement a method injectCode: which would take a block and peersist it.
 Later, when runCodeWithData: is called, the class should apply the saved block to each
 element of the array, creating either a character with the same name either a clone
 named "Agent Smith". If the name is not "Neo", the clone of "Agent Smith" is created.

 - Example:
 Input: ["Jane Doe", "Delivery Guy", "Postman", "Neo", "Agent John", "Dog"]
 Output: [Character(name: "Agent Smith", isClone: true),
          Character(name: "Agent Smith", isClone: true),
          Character(name: "Agent Smith", isClone: true),
          Character(name: "Neo", isClone: false),
          Character(name: "Agent Smith", isClone: true),
          Character(name: "Agent Smith", isClone: true)]
 */
@protocol Character <NSObject>
- (NSString *)name;
- (BOOL)isClone;
+ (instancetype)createWithName:(NSString *)name isClone:(BOOL)clone;
@end
@interface MatrixHacker : NSObject
/**
 Injects the given block into the Matrix by saving it in the class.

 @param theBlock the block of code to be injected
 */
- (void)injectCode:(id<Character> (^)(NSString *name))theBlock;
/**
 Runs the saved block of code against every element of the array

 @param names the array of names of characters
 @return an array of character after applying the injected block
 */
- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names;
@end
