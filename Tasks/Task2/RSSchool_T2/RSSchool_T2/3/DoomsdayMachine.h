#import <Foundation/Foundation.h>
/*
 You are a Borg and you are going to assimilate the humans.
 The date of assimilation is set to 14 August 2208 03:13:37 (in obsolete human calendar)
 However, the Borg messep up the date format with their own,
 so 26 March 2019 12:34:56 in human will look like:
 2019:03:26@56\34/12

 As an engineer, you need to design a program which will take a messed up date string and
 return how many years, months, weeks, days, hours, minutes and seconds left between
 the specified date and the assimilation date. You need to create a class conforming to
 AssimilationInfo protocol and use it as a wrapper for the returned data.
 - Example
 Input: 2200:01:01@15\30/00
 Output: AssimilationInfo(years:8, months:7, days:13, hours:2, minutes:43, seconds:22)

 The machine should also be able to return the assimilation date in string
 representation for humans to behold and the format should be easily read by them.
 (as it would be displayed on the countdown screen)
 - Example
 Output: Sunday, August 14, 2208
 */
@protocol AssimilationInfo <NSObject>
@property (nonatomic, readonly) NSString *dateString;
@property (nonatomic, readonly) NSInteger years;
@property (nonatomic, readonly) NSInteger months;
@property (nonatomic, readonly) NSInteger weeks;
@property (nonatomic, readonly) NSInteger days;
@property (nonatomic, readonly) NSInteger hours;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger seconds;
@end
@interface DoomsdayMachine : NSObject
/**
 Returns AssimilationInfo for a gived date string

 @param dateString a date string in a messed up Borg format
 @return AssimilationInfo for the specified date
 */
- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString;
/**
 Returns a human-readable string of the assimilation date

 @return a human-readable string
 */
- (NSString *)doomsdayString;
@end
