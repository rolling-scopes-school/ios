#import "DoomsdayMachine.h"
@interface DoomsdayMachine ()

@property (nonatomic, readwrite) NSInteger years;
@property (nonatomic, readwrite) NSInteger months;
@property (nonatomic, readwrite) NSInteger weeks;
@property (nonatomic, readwrite) NSInteger days;
@property (nonatomic, readwrite) NSInteger hours;
@property (nonatomic, readwrite) NSInteger minutes;
@property (nonatomic, readwrite) NSInteger seconds;
@property (retain, nonatomic) NSDateFormatter* dateFormarter;

@end
 NSString*  formatDate = @"yyyy:MM:dd@ss\\mm/H";
 NSString*  dateOfEndInMachine = @"2208:08:14@37\\13/03";
 NSString*  dateOfEndInHuman = @"Sunday, August 14, 2208";
@implementation DoomsdayMachine
- (instancetype)init
{
    self = [super init];
    if (self) {
        _dateFormarter = [NSDateFormatter new];
        [_dateFormarter setDateFormat:formatDate];
    }
    return self;
}
- (NSString*)doomsdayString {
    return dateOfEndInHuman;
}

- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    NSDateComponents* CalendarComponents = [[NSCalendar currentCalendar]
                                    components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
                                    fromDate:[_dateFormarter dateFromString:dateString]
                                    toDate:[_dateFormarter dateFromString:dateOfEndInMachine]
                                    options:0];
    return [self convertComponentsToDoom:CalendarComponents];
}

- (DoomsdayMachine*) convertComponentsToDoom:(NSDateComponents*) dateComponents {
    DoomsdayMachine* machine = [[[DoomsdayMachine alloc] init] autorelease];
    machine.years = dateComponents.year;
    machine.months = dateComponents.month;
    machine.days = dateComponents.day;
    machine.hours = dateComponents.hour;
    machine.minutes = dateComponents.minute;
    machine.seconds = dateComponents.second;
    return machine;
}

- (void)dealloc
{
    [_dateFormarter release];
    [super dealloc];
}
@synthesize dateString;

@end
