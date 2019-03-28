#import <XCTest/XCTest.h>
#import "KidnapperNote.h"

@interface KidnapperNoteTests : XCTestCase
@property (nonatomic, retain) KidnapperNote *note;
@end

@implementation KidnapperNoteTests

- (void)setUp {
  self.note = [KidnapperNote new];
}

- (void)test1 {
  XCTAssertTrue([self.note checkMagazine:@"I will give you one grand for today"
                                    note:@"give one grand today"]);
}

- (void)test2 {
  XCTAssertTrue([self.note checkMagazine:@"To be alone is to be free"
                                    note:@"Be alone"]);
}

- (void)test3 {
  XCTAssertFalse([self.note checkMagazine:@"He put the money in a black bag"
                                     note:@"Put the money in the black bag"]);
}

- (void)test4 {
  XCTAssertFalse([self.note checkMagazine:@"Always call the cops in case of trouble"
                                     note:@"don't call the cops"]);
}

- (void)test5 {
  XCTAssertFalse([self.note checkMagazine:@"Don't leave your the bag outside"
                                     note:@"hide the bag and leave"]);
}

@end
