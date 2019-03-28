#import <XCTest/XCTest.h>
#import "RomanTranslator.h"

@interface RomanTranslatorTests : XCTestCase
@property (nonatomic, retain) RomanTranslator *translator;
@end

@implementation RomanTranslatorTests

- (void)setUp {
  self.translator = [RomanTranslator new];
}

- (void)test1 {
  XCTAssertEqual(@"III", [self.translator romanFromArabic:@"3"]);
}

- (void)test2 {
  XCTAssertEqual(@"IV", [self.translator romanFromArabic:@"4"]);
}

- (void)test3 {
  XCTAssertEqual(@"IX", [self.translator romanFromArabic:@"9"]);
}

- (void)test4 {
  XCTAssertEqual(@"LVIII", [self.translator romanFromArabic:@"58"]);
}

- (void)test5 {
  XCTAssertEqual(@"MCMXCIV", [self.translator romanFromArabic:@"1994"]);
}

- (void)test6 {
  XCTAssertEqual(@"3", [self.translator arabicFromRoman:@"III"]);
}

- (void)test7 {
  XCTAssertEqual(@"4", [self.translator arabicFromRoman:@"IV"]);
}

- (void)test8 {
  XCTAssertEqual(@"9", [self.translator arabicFromRoman:@"IX"]);
}

- (void)test9 {
  XCTAssertEqual(@"58", [self.translator arabicFromRoman:@"LVIII"]);
}

- (void)test10 {
  XCTAssertEqual(@"1994", [self.translator arabicFromRoman:@"MCMXCIV"]);
}


@end
