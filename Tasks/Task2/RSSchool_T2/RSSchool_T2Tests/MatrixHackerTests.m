#import <XCTest/XCTest.h>
#import "MatrixHacker.h"

@interface MatrixHackerTests : XCTestCase
@property (nonatomic, strong) MatrixHacker *hacker;
@property (nonatomic, retain) NSArray *people;
@end

@interface Char : NSObject <Character>
@end
@implementation Char
@end

@implementation MatrixHackerTests

- (void)setUp {
  self.hacker = [MatrixHacker new];
  self.people = @[@"Delivery Guy", @"Neo", @"Policeman", @"Agent John", @"Agent Black", @"Bartender"];
}

- (void)test1 {
  __block NSInteger counter = 0;
  [self.hacker injectCode:^id<Character>(NSString *name) {
    counter += 1;
    return [Char new];
  }];
  [self.hacker runCodeWithData:self.people];
  XCTAssertTrue(self.people.count == counter);
}


@end
