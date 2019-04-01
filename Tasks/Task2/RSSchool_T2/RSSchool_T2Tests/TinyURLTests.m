#import <XCTest/XCTest.h>
#import "TinyURL.h"

@interface TinyURLTests : XCTestCase
@property (nonatomic, retain) TinyURL *urlEncoder;
@end

@implementation TinyURLTests

- (void)setUp {
  self.urlEncoder = [TinyURL new];
}


- (void)test1 {
  NSURL *url = [[NSURL alloc] initWithString:@"https://rs.school/ios/index.html"];
  NSURL *encoded = [self.urlEncoder encode:url];

  NSURL *decoded = [self.urlEncoder decode:encoded];
  XCTAssertTrue([url.absoluteString isEqualToString:decoded.absoluteString]);
}

- (void)test2 {
  NSURL *url = [[NSURL alloc] initWithString:@"https://google.com"];
  NSURL *encoded = [self.urlEncoder encode:url];

  NSURL *decoded = [self.urlEncoder decode:encoded];
  XCTAssertTrue([url.absoluteString isEqualToString:decoded.absoluteString]);
}

- (void)test3 {
  NSURL *url = [[NSURL alloc] initWithString:@"https://yandex.by/images/"];
  NSURL *encoded = [self.urlEncoder encode:url];

  NSURL *decoded = [self.urlEncoder decode:encoded];
  XCTAssertTrue([url.absoluteString isEqualToString:decoded.absoluteString]);
}

- (void)test4 {
  NSURL *url1 = [[NSURL alloc] initWithString:@"https://rs.school/ios/index.html"];
  NSURL *encoded1 = [self.urlEncoder encode:url1];
  NSURL *decoded1 = [self.urlEncoder decode:encoded1];
  XCTAssertTrue([url1.absoluteString isEqualToString:decoded1.absoluteString]);

  NSURL *url2 = [[NSURL alloc] initWithString:@"http://rs.school/ios/index.html"];
  NSURL *encoded2 = [self.urlEncoder encode:url2];
  NSURL *decoded2 = [self.urlEncoder decode:encoded2];
  XCTAssertTrue([url2.absoluteString isEqualToString:decoded2.absoluteString]);

  XCTAssertFalse([encoded1.absoluteString isEqualToString:encoded2.absoluteString]);
}

@end
