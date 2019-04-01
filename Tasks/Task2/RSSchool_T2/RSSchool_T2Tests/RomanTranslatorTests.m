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
  XCTAssertTrue([@"III" isEqualToString:[self.translator romanFromArabic:@"3"]]);
}

- (void)test2 {
  XCTAssertTrue([@"IV" isEqualToString:[self.translator romanFromArabic:@"4"]]);
}

- (void)test3 {
  XCTAssertTrue([@"IX" isEqualToString:[self.translator romanFromArabic:@"9"]]);
}

- (void)test4 {
  XCTAssertTrue([@"LVIII" isEqualToString:[self.translator romanFromArabic:@"58"]]);
}

- (void)test5 {
  XCTAssertTrue([@"MCMXCIV" isEqualToString:[self.translator romanFromArabic:@"1994"]]);
}

- (void)test6 {
  XCTAssertTrue([@"3" isEqualToString:[self.translator arabicFromRoman:@"III"]]);
}

- (void)test7 {
  XCTAssertTrue([@"4" isEqualToString:[self.translator arabicFromRoman:@"IV"]]);
}

- (void)test8 {
  XCTAssertTrue([@"9" isEqualToString:[self.translator arabicFromRoman:@"IX"]]);
}

- (void)test9 {
  XCTAssertTrue([@"58" isEqualToString:[self.translator arabicFromRoman:@"LVIII"]]);
}

- (void)test10 {
  XCTAssertTrue([@"1994" isEqualToString:[self.translator arabicFromRoman:@"MCMXCIV"]]);
}


@end
