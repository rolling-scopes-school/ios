#import "TinyURL.h"

@interface TinyURL()
@property (nonatomic, retain, readwrite) NSMutableDictionary *dictionaryWithURLs;
@end

@implementation TinyURL
// your code here

- (instancetype)init {
    self = [super init];
    if (self) {
        _dictionaryWithURLs = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (NSURL *)encode:(NSURL *)originalURL {
    NSInteger hashInt = [originalURL hash];
    NSData *data = [[NSString stringWithFormat:@"%ld", (long)hashInt] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    NSString *shortenedURLString = [NSString stringWithFormat:@"https://vk.cc/%@", base64String];
    NSURL *shortenedURL = [NSURL URLWithString:shortenedURLString];
    [self.dictionaryWithURLs setValue:originalURL forKey:shortenedURLString];
    return shortenedURL;
}


- (NSURL *)decode:(NSURL *)shortenedURL {
    NSURL *originalURL = [self.dictionaryWithURLs valueForKey:[NSString stringWithFormat:@"%@", shortenedURL]];
    return originalURL;
}

-(void)dealloc {
    self.dictionaryWithURLs = nil;
    [super dealloc];
}

@end
