//
//  DoomsdayMachineTests.m
//  RSSchool_T2Tests
//
//  Created by Alexander Shalamov on 3/26/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DoomsdayMachine.h"
@interface DoomsdayMachineTests : XCTestCase
@property (nonatomic, retain) DoomsdayMachine *machine;
@end

@implementation DoomsdayMachineTests

- (void)setUp {
  self.machine = [DoomsdayMachine new];
}

- (void)test1 {
  XCTAssertEqual(@"Sunday, August 14, 2208", [self.machine doomsdayString]);
}

- (void)test2 {
  id<AssimilationInfo> assimilationInfo = [self.machine assimilationInfoForCurrentDateString:@"2019:03:26@00\\00/12"];
  [assimilationInfo retain];
  XCTAssertEqual(assimilationInfo.years, 189);
  XCTAssertEqual(assimilationInfo.months, 4);
  XCTAssertEqual(assimilationInfo.days, 18);
  XCTAssertEqual(assimilationInfo.hours, 15);
  XCTAssertEqual(assimilationInfo.minutes, 13);
  XCTAssertEqual(assimilationInfo.seconds, 37);
  XCTAssertEqual(assimilationInfo.dateString, @"2019:03:26@00\\00/12");
}

- (void)test3 {
  id<AssimilationInfo> assimilationInfo = [self.machine assimilationInfoForCurrentDateString:@"2219:01:01@00\\00/00"];
  [assimilationInfo retain];
  XCTAssertEqual(assimilationInfo.years, -10);
  XCTAssertEqual(assimilationInfo.months, -4);
  XCTAssertEqual(assimilationInfo.days, -17);
  XCTAssertEqual(assimilationInfo.hours, -20);
  XCTAssertEqual(assimilationInfo.minutes, -46);
  XCTAssertEqual(assimilationInfo.seconds, -23);
  XCTAssertEqual(assimilationInfo.dateString, @"2219:01:01@00\\00/00");
}

@end
