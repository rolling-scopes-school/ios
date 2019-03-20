#import <Foundation/Foundation.h>

@interface ResultObject : NSObject
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, assign) BOOL status;
@end

@interface Sorted : NSObject
- (ResultObject*)sorted:(NSString*)string;
@end
