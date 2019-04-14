//
//  ArrayPrintTests.m
//  RSSchool_T3Tests
//
//  Created by Alexander Shalamov on 4/8/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ArrayPrint.h"

@interface ArrayPrintTests : XCTestCase
@end

@implementation ArrayPrintTests

- (void)test1 {
  NSArray *array = @[@[@0, @1, @2], [NSNull null], @[@"123",@"456",@"789"], @[@[@[@1337], @{@"Key": @"Value"}]]];
  NSString *output = @"[[0,1,2],null,[\"123\",\"456\",\"789\"],[[[1337],unsupported]]]";
  XCTAssertTrue([output isEqualToString:[array print]]);
}

- (void)test2 {
  NSArray *array = @[@[@[@[@[@[@[@[@[@[]]]]]]]]]];
  XCTAssertTrue([@"[[[[[[[[[[]]]]]]]]]]" isEqualToString:[array print]]);
}

- (void)test3 {
  NSArray *array = @[@{@"123": @123}, [NSDate new], [UIViewController new]];
  XCTAssertTrue([@"[unsupported,unsupported,unsupported]" isEqualToString:[array print]]);
}

@end
