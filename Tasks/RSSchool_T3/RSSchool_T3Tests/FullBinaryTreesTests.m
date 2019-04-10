#import <XCTest/XCTest.h>
#import "FullBinaryTrees.h"
#import "ArrayPrint.h"

@interface FullBinaryTreesTests : XCTestCase
@property (nonatomic, retain) FullBinaryTrees *solution;
@end

@implementation FullBinaryTreesTests

- (NSString *)sanitize:(NSString *)string {
  return [[string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
            componentsJoinedByString:@""];
}

- (void)setUp {
  _solution = [FullBinaryTrees new];
}

- (void)test1 {
  NSString *output = [self sanitize:[self.solution stringForNodeCount:1]];
  XCTAssertTrue([@"[[0]]" isEqualToString:output]);
}

- (void)test2 {
  XCTAssertTrue([@"[]" isEqualToString:[self.solution stringForNodeCount:0]]);
}

- (void)test3 {
  XCTAssertTrue([@"[]" isEqualToString:[self.solution stringForNodeCount:4]]);
}

- (void)test4 {
  NSString *output = [self sanitize:[self.solution stringForNodeCount:7]];
  XCTAssertTrue([output containsString:@"[0,0,0,null,null,0,0,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,null,null,0,0,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,null,null,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,null,null,0,0]"]);
}

- (void)test5 {
  NSString *output = [self sanitize:[self.solution stringForNodeCount:9]];
  XCTAssertTrue([output containsString:@"[0,0,0,null,null,0,0,null,null,0,0,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,null,null,0,0,null,null,0,0,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,null,null,0,0,0,0,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,null,null,0,0,0,0,null,null,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,null,null,0,0,0,0,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,0,0,null,null,null,null,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,0,0,null,null,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,0,0,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,0,0,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,null,null,null,null,0,0,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,null,null,null,null,0,0,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,null,null,0,0,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,null,null,0,0,null,null,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0,null,null,0,0,null,null,0,0]"]);
}

- (void)test6 {
  NSString *output = [self sanitize:[self.solution stringForNodeCount:5]];
  XCTAssertTrue([output containsString:@"[0,0,0,null,null,0,0]"]);
  XCTAssertTrue([output containsString:@"[0,0,0,0,0]"]);
}

@end
