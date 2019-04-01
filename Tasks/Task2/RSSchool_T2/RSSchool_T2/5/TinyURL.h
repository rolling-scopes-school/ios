#import <Foundation/Foundation.h>
/*
 URL shortening services like tinyurl.com or vk.cc allow you to enter a URL
 such as https://drive.google.com/file/d/1EBGP1ntXPGVSfYyKGenOdzgh_hna4vg4/view
 and get back a short one such as https://vk.cc/9dEj5S

 Design the encode and decode methods for the TinyURL service.
 There is no restriction on how your encode/decode algorithm should work.
 You just need to ensure that a URL can be encoded to a tiny URL
 and the tiny URL can be decoded to the original URL.
 */
@interface TinyURL : NSObject
/**
 Takes a URL and encodes it into a tiny format

 @param originalURL the URL
 @return encoded URL
 */
- (NSURL *)encode:(NSURL *)originalURL;
/**
 Taken an encoded URL and returns its original form

 @param shortenedURL encoded URL
 @return original URL
 */
- (NSURL *)decode:(NSURL *)shortenedURL;
@end
