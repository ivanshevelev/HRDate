//
//  NSDate+HRDate.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import "NSDate+HRDate.h"
#import "NSDateComponents+HRAllComponents.h"
#import "NSCalendar+HRUTCCalendar.h"
#import "NSDateFormatter+HRUTCDateFormatter.h"

NSUInteger const HRDateHoursInDay = 24;

NSUInteger const HRDateMinutesInHour = 60;
NSUInteger const HRDateMinutesInDay = 1440;

NSUInteger const HRDateSecondsInMinute = 60;
NSUInteger const HRDateSecondsInHour = 3600;
NSUInteger const HRDateSecondsInDay = 86400;

@implementation NSDate (HRCommon)

#pragma mark - Date Components

-(NSDateComponents *)_hrDateComponents {
    return [NSDateComponents hrUTCAllComponentsFromDate:self];
}

#pragma mark - Date Formatter With Date Format

+(NSDateFormatter *)_hrDateFormatterWithDateFormat:(nonnull NSString *)dateFormat {
    NSParameterAssert(dateFormat);
    NSDateFormatter *dateFormatter = [NSDateFormatter hrUTCDateFormatter];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

-(NSDateFormatter *)_hrDateFormatterWithDateFormat:(nonnull NSString *)dateFormat {
    return [self.class _hrDateFormatterWithDateFormat:dateFormat];
}

#pragma mark - Date Components With Date Style

+(NSDateFormatter *)_hrDateFormatterWithDateStyle:(NSDateFormatterStyle)dateStyle
                                  andTimeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *dateFormatter = [NSDateFormatter hrUTCDateFormatter];
    dateFormatter.dateStyle = dateStyle;
    dateFormatter.timeStyle = timeStyle;
    return dateFormatter;
}

-(NSDateFormatter *)_hrDateFormatterWithDateStyle:(NSDateFormatterStyle)dateStyle
                                  andTimeStyle:(NSDateFormatterStyle)timeStyle {
    return [self.class _hrDateFormatterWithDateStyle:dateStyle
                                     andTimeStyle:timeStyle];
}

@end

@implementation NSDate (HRDateCompare)

-(BOOL)hrIsEqualToDateIgnoringTime:(NSDate *)date {
    NSParameterAssert(date);
    NSDateComponents *selfDateComponenets = [self _hrDateComponents];
    NSDateComponents *anotherDateComponenets = [NSDateComponents hrUTCAllComponentsFromDate:date];
    
    return
    selfDateComponenets.year  == anotherDateComponenets.year  &&
    selfDateComponenets.month == anotherDateComponenets.month &&
    selfDateComponenets.day   == anotherDateComponenets.day;
}

-(BOOL)hrIsToday {
    NSCalendar *calendar = [NSCalendar hrUTCCalendar];
    return [calendar isDateInToday:self];
}

-(BOOL)hrIsTomorrow {
    NSCalendar *calendar = [NSCalendar hrUTCCalendar];
    return [calendar isDateInTomorrow:self];
}

-(BOOL)hrIsYesterday {
    NSCalendar *calendar = [NSCalendar hrUTCCalendar];
    return [calendar isDateInYesterday:self];
}

@end

@implementation NSDate (HRDateComponents)

-(NSInteger)hrEra {
    return [self _hrDateComponents].era;
}

-(NSInteger)hrDay {
    return [self _hrDateComponents].day;
}

-(NSInteger)hrMonth {
    return [self _hrDateComponents].month;
}

-(NSInteger)hrYear {
    return [self _hrDateComponents].year;
}

-(NSInteger)hrHour {
    return [self _hrDateComponents].hour;
}

-(NSInteger)hrMinute {
    return [self _hrDateComponents].minute;
}

-(NSInteger)hrSecond {
    return [self _hrDateComponents].second;
}

-(NSInteger)hrWeekday {
    return [self _hrDateComponents].weekday;
}

-(NSInteger)hrWeekdayOrdinal {
    return [self _hrDateComponents].weekdayOrdinal;
}

-(NSInteger)hrWeekOfMonth {
    return [self _hrDateComponents].weekOfMonth;
}

-(NSInteger)hrWeekOfYear {
    return [self _hrDateComponents].weekOfYear;
}

-(NSInteger)hrYearForWeekOfYear {
    return [self _hrDateComponents].yearForWeekOfYear;
}

-(NSInteger)hrNanosecond {
    return [self _hrDateComponents].nanosecond;
}

-(NSTimeZone *)hrTimeZone {
    return [self _hrDateComponents].timeZone;
}

-(NSCalendar *)hrCalendar {
    return [self _hrDateComponents].calendar;
}

@end

@implementation NSDate (HRDateFactory)

-(nonnull NSDate *)hrDateAfterDays:(NSInteger)days {
    return [self dateByAddingTimeInterval:(NSInteger)HRDateSecondsInDay * days];
}

-(nonnull NSDate *)hrDateAfterHours:(NSInteger)hours {
    NSTimeInterval timeInterval = (NSInteger)HRDateSecondsInHour * hours;
    NSDate *date = [self dateByAddingTimeInterval:timeInterval];
    return date;
}

-(nonnull NSDate *)hrDateAfterMonths:(NSInteger)months {
    NSParameterAssert(months <= 12);
    NSDateComponents *dateComponents = [NSDateComponents hrURCEmptyComponents];
    dateComponents.month = months;
    NSCalendar *calendar = [NSCalendar hrUTCCalendar];
    NSDate *date = [calendar dateByAddingComponents:dateComponents
                                             toDate:self
                                            options:0];
    return date;
}

+(nonnull NSDate *)hrYesterday {
    NSDate *today = [self date];
    NSDate *result = [today hrDateAfterDays:-1];
    return result;
}

+(nonnull NSDate *)hrTomorrow {
    NSDate *today = [self date];
    NSDate *result = [today hrDateAfterDays:1];
    return result;
}

+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string
                      withDateFormat:(nonnull NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [self _hrDateFormatterWithDateFormat:dateFormat];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string
                       withDateStyle:(NSDateFormatterStyle)dateStyle
                        andTimeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *dateFormatter = [self _hrDateFormatterWithDateStyle:dateStyle
                                                            andTimeStyle:timeStyle];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

+(nullable NSDate *)hrDateWithHour:(NSUInteger)hour
                            minute:(NSUInteger)minute
                            second:(NSUInteger)second
                               day:(NSUInteger)day
                             month:(NSUInteger)month
                           andYear:(NSUInteger)year {
    NSDateComponents *emptyDateComponents = [NSDateComponents hrURCEmptyComponents];
    emptyDateComponents.hour = hour;
    emptyDateComponents.minute = minute;
    emptyDateComponents.second = second;
    emptyDateComponents.day = day;
    emptyDateComponents.month = month;
    emptyDateComponents.year = year;
    NSCalendar *UTCCalendar = [NSCalendar hrUTCCalendar];
    NSDate *date = [UTCCalendar dateFromComponents:emptyDateComponents];
    return date;
}

+(nullable NSDate *)hrDateWithDay:(NSUInteger)day
                            month:(NSUInteger)month
                          andYear:(NSUInteger)year {
    return [self hrDateWithHour:0
                         minute:0
                         second:0
                            day:day
                          month:month
                        andYear:year];
}

+(nullable NSDate *)hrDateWithHourDifference:(NSInteger)hourDifference {
    NSDate *today = [NSDate date];
    NSTimeInterval timeInterval = (NSInteger)HRDateSecondsInHour * hourDifference;
    NSDate *result = [today dateByAddingTimeInterval:timeInterval];
    return result;
}

@end

@implementation NSDate (HRDateString)

-(nullable NSString *)hrDateStringWithDateFormat:(nonnull NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [self _hrDateFormatterWithDateFormat:dateFormat];
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}

-(nonnull NSString *)hrDateStringWithDateStyle:(NSDateFormatterStyle)dateStyle
                                  andTimeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *dateFormatter = [self _hrDateFormatterWithDateStyle:dateStyle
                                                            andTimeStyle:timeStyle];
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}

@end
