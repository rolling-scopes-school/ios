#import <XCTest/XCTest.h>
#import "SummArray.h"

@interface SummArray_Test : XCTestCase
@property(nonatomic, strong) SummArray *summ;
@end

@implementation SummArray_Test

- (void)setUp {
    _summ = [SummArray new];
}

- (void)testSumm1 {
    NSArray *a = @[@(1), @(2), @(3), @(4), @(10), @(11)];
    XCTAssertTrue([@(31) isEqual:[self.summ summArray:a]]);
}

- (void)testSumm2 {
    NSArray *a = @[@(-2), @(8), @(17), @(4), @(10), @(11), @(21), @(0)];
    XCTAssertTrue([@(69) isEqual:[self.summ summArray:a]]);
}

- (void)testSumm3 {
    NSArray *a = @[@"1000.0", @"2.0", @"3", @"41", @"10", @"11", @"-900"];
    XCTAssertTrue([@(167) isEqual:[self.summ summArray:a]]);
}
@end
