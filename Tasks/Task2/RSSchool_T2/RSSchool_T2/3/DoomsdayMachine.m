#import "DoomsdayMachine.h"


@interface Assimilation : NSObject <AssimilationInfo>
@property (nonatomic, readwrite) NSInteger years;
@property (nonatomic, readwrite) NSInteger months;
@property (nonatomic, readwrite) NSInteger weeks;
@property (nonatomic, readwrite) NSInteger days;
@property (nonatomic, readwrite) NSInteger hours;
@property (nonatomic, readwrite) NSInteger minutes;
@property (nonatomic, readwrite) NSInteger seconds;

@end

@implementation Assimilation

@synthesize years;
@synthesize months;
@synthesize weeks;
@synthesize days;
@synthesize hours;
@synthesize minutes;
@synthesize seconds;


@end

@implementation DoomsdayMachine
// your code here

- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    Assimilation *assimilationInfo = [[Assimilation new] autorelease];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *assimilationDate = [dateFormatter dateFromString:@"2208-08-14 03:13:37"];
    NSDate *specifiedDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@-%@-%@ %@:%@:%@", [dateString substringWithRange: NSMakeRange(0, 4)], [dateString substringWithRange: NSMakeRange(5, 2)], [dateString substringWithRange: NSMakeRange(8, 2)], [dateString substringWithRange: NSMakeRange(17, 2)], [dateString substringWithRange: NSMakeRange(14, 2)], [dateString substringWithRange: NSMakeRange(11, 2)]]];
    [dateFormatter release];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components: NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMonth | NSCalendarUnitYear fromDate: specifiedDate toDate: assimilationDate options: 0];
    assimilationInfo.seconds = components.second;
    assimilationInfo.minutes = components.minute;
    assimilationInfo.hours = components.hour;
    assimilationInfo.days = components.day;
    assimilationInfo.months = components.month;
    assimilationInfo.years = components.year;

    return assimilationInfo;
}

- (NSString *)doomsdayString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *assimilationDate = [dateFormatter dateFromString:@"2208-08-14 03:13:37"];
    [dateFormatter setDateFormat:@"EEEE, MMMM d, yyyy"];
    NSString *assimilationDateNewFormat = [dateFormatter stringFromDate:assimilationDate];
    
    [dateFormatter release];
    
    return assimilationDateNewFormat;
}

@end
