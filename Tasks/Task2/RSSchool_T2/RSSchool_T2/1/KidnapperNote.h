#import <Foundation/Foundation.h>
/*
 Harold is a kidnapper who wrote a ransom note, but now he is worried it will be traced back to him through his handwriting. He found a magazine and wants to know if he can cut out whole words from it and use them to create an untraceable replica of his ransom note. The words in his note are case-insensitive and he must use only whole words available in the magazine. He cannot use substrings or concatenation to create the words he needs.
 Given the words in the magazine and the words in the ransom note, complete the checkMagazine function to return YES if he can replicate his ransom note exactly using whole words from the magazine; otherwise, return NO.
 For example, the note is "Attack At Dawn". The magazine contains only "attack at dawn". The magazine has all the right words and even if there's a case mismatch, the answer is YES.
 Another example, the note says "give two grand today" and the magazine contains "give me one grand today night". The magazine doesnt have all the right words, so the answer is NO.
*/

@interface KidnapperNote : NSObject
/**
 A function to check if a magazine can be used for a ransom note.

 @param magaine a string, representing the text of a magazine
 @param note a string, representing a desired ransom note
 @return flag indicating if a magazine can be used for a ransom note, YES or NO
 */
- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note;
@end
