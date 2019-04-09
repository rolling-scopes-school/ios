#import <Foundation/Foundation.h>
/*
 You need to extend NSArray functionality and add a method which will print it's contents.
 It should also print square brackets for the beginning and the end of the array.

 - Example
 Input: @[@[@0, @1, @2], [NSNull null], @[@"123",@"456",@"789"], @[@[@[@1337], @{@"Key": @"Value"}]]]
 Output: [[0,1,2],null,["123","456","789"],[[[1337],unsupported]]]

 Following element types should be supported:
 NSNumber
 NSNull
 NSArray
 NSString

 For all the others, it should print `unsupported`
 */
@interface NSArray (RSSchool_Extension_Name)
- (NSString *)print;
@end
