#import <XCTest/XCTest.h>

@implementation XCUIElement (Extensions)
- (void)clearText {
  if (!self) {
    return;
  }
  if (![self.value isKindOfClass:[NSString class]]) {
    return;
  }
  NSString *stringValue = (NSString *)self.value;
  for (NSInteger i = 0; i < stringValue.length; i++) {
    [self typeText:XCUIKeyboardKeyDelete];
  }
}
@end


@interface RSSchool_T3UITests : XCTestCase
@property (nonatomic, retain) XCUIApplication *app;
@property (nonatomic, retain) NSDateFormatter *formatter;
@end

@implementation RSSchool_T3UITests

- (void)setUp {
  self.continueAfterFailure = NO;
  _formatter = [NSDateFormatter new];
  _formatter.dateFormat = @"dd/MM/yyyy HH:mm";
  _app = [[XCUIApplication alloc] init];
  [_app launch];
}

- (void)test0 {
  XCTAssertTrue(_app.textFields[@"Step"].exists);
  XCTAssertTrue(_app.textFields[@"Date unit"].exists);
  XCTAssertTrue(_app.textFields[@"Start date"].exists);
  XCTAssertTrue(_app.buttons[@"Add"].exists);
  XCTAssertTrue(_app.buttons[@"Sub"].exists);
}

- (void)test1 {
  XCUIElement *unitsCount = _app.textFields[@"Step"];
  [unitsCount tap];
  [unitsCount typeText:@"1234567890"];
  NSString *text = unitsCount.value;
  XCTAssertTrue([@"1234567890" isEqualToString:text]);
}

- (void)test2 {
  XCUIElement *unit = _app.textFields[@"Date unit"];
  [unit tap];
  [unit typeText:@"1234567890"];
  NSString *text = unit.value;
  XCTAssertTrue([@"Date unit" isEqualToString:text]);
}

- (void)test3 {
  NSString *dateString = [_formatter stringFromDate:[NSDate date]];
  XCTAssertTrue(_app.staticTexts[dateString].exists);
}

- (void)test4 {
  XCUIElement *unitsCount = _app.textFields[@"Step"];
  [unitsCount tap];
  [unitsCount typeText:@"abcdefghtijklmnop!#./:;-=+§±  \n"];
  NSString *text = unitsCount.value;
  XCTAssertTrue([@"Step" isEqualToString:text]);
}

- (void)test5 {
  NSString *dateString = [[_formatter stringFromDate:[NSDate date]] retain];
  XCTAssertTrue(_app.staticTexts[dateString].exists);

  XCUIElement *unitsCount = _app.textFields[@"Step"];
  [unitsCount tap];
  [unitsCount typeText:@"1"];

  XCUIElement *unit = _app.textFields[@"Date unit"];
  [unit tap];
  [unit typeText:@"day"];

  XCUIElement *add = _app.buttons[@"Add"];
  [add tapWithNumberOfTaps:3 numberOfTouches:1];

  [unitsCount tap];
  [unitsCount clearText];
  [unitsCount typeText:@"8"];

  [unit tap];
  [unit clearText];
  [unit typeText:@"hour"];

  XCUIElement *sub = _app.buttons[@"Sub"];
  [sub tapWithNumberOfTaps:9 numberOfTouches:1];

  XCTAssertTrue(_app.staticTexts[dateString].exists);
}

- (void)test6 {
  XCUIElement *start = _app.textFields[@"Start date"];
  [start tap];
  [start typeText:@"02/02/2022 22:22"];

  XCTAssertTrue(_app.staticTexts[@"02/02/2022 22:22"].exists);

  XCUIElement *unitsCount = _app.textFields[@"Step"];
  [unitsCount tap];
  [unitsCount typeText:@"1"];

  XCUIElement *unit = _app.textFields[@"Date unit"];
  [unit tap];
  [unit typeText:@"year"];

  XCUIElement *add = _app.buttons[@"Add"];
  [add tapWithNumberOfTaps:1 numberOfTouches:1];

  XCTAssertTrue(_app.staticTexts[@"02/02/2023 22:22"].exists);

  [unitsCount tap];
  [unitsCount clearText];
  [unitsCount typeText:@"6"];

  [unit tap];
  [unit clearText];
  [unit typeText:@"month"];

  XCUIElement *sub = _app.buttons[@"Sub"];
  [sub tapWithNumberOfTaps:1 numberOfTouches:1];

  XCTAssertTrue(_app.staticTexts[@"02/08/2022 22:22"].exists);

  [unitsCount tap];
  [unitsCount clearText];
  [unitsCount typeText:@"2"];

  [unit tap];
  [unit clearText];
  [unit typeText:@"week"];

  [sub tapWithNumberOfTaps:5 numberOfTouches:1];

  XCTAssertTrue(_app.staticTexts[@"24/05/2022 22:22"].exists);

  [unitsCount tap];
  [unitsCount clearText];
  [unitsCount typeText:@"42"];

  [unit tap];
  [unit clearText];
  [unit typeText:@"day"];

  [sub tapWithNumberOfTaps:1 numberOfTouches:1];

  XCTAssertTrue(_app.staticTexts[@"12/04/2022 22:22"].exists);

  [unitsCount tap];
  [unitsCount clearText];
  [unitsCount typeText:@"2106"];

  [unit tap];
  [unit clearText];
  [unit typeText:@"hour"];

  [sub tapWithNumberOfTaps:2 numberOfTouches:1];

  XCTAssertTrue(_app.staticTexts[@"19/10/2021 10:22"].exists);

  [unitsCount tap];
  [unitsCount clearText];
  [unitsCount typeText:@"11111"];

  [unit tap];
  [unit clearText];
  [unit typeText:@"minute"];

  [sub tapWithNumberOfTaps:5 numberOfTouches:1];

  XCTAssertTrue(_app.staticTexts[@"10/09/2021 20:27"].exists);

  [unitsCount tap];
  [unitsCount clearText];
  [unitsCount typeText:@"213"];

  [unit tap];
  [unit clearText];
  [unit typeText:@"minute"];

  [add tap];

  XCTAssertTrue(_app.staticTexts[@"11/09/2021 00:00"].exists);
}

@end
