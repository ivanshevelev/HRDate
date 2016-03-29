//
//  NSDate+HRDate.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import "NSDate+HRDate.h"
#import "NSDateComponents+HRAllComponents.h"

NSUInteger const HRDateHoursInDay = 24;

NSUInteger const HRDateMinutesInHour = 60;
NSUInteger const HRDateMinutesInDay = 1440;

NSUInteger const HRDateSecondsInMinute = 60;
NSUInteger const HRDateSecondsInHour = 3600;
NSUInteger const HRDateSecondsInDay = 86400;

@implementation NSDate (HRCommon)

#pragma mark - Date Components

-(NSDateComponents *)_hrDateComponents {
    static NSDateComponents *dateComponents = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        dateComponents = [NSDateComponents hrUTCAllComponentsFromDate:self];
    });
    return dateComponents;
}

#pragma mark - Date Formatter With Date Format

+(NSDateFormatter *)_hrDateFormatterWithDateFormat:(nonnull NSString *)dateFormat {
    NSParameterAssert(dateFormat);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

-(NSDateFormatter *)_hrDateFormatterWithDateFormat:(nonnull NSString *)dateFormat {
    return [self.class _hrDateFormatterWithDateFormat:dateFormat];
}

#pragma mark - Date Components With Date Style

+(NSDateFormatter *)_hrDateFormatterWithDateStyle:(NSDateFormatterStyle)dateStyle
                                  andTimeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
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

-(BOOL)hrIsToday {
    NSDateComponents *selfDateComponenets = [self _hrDateComponents];
    NSDateComponents *todayDateComponenets = [NSDateComponents hrUTCAllComponentsFromDate:[NSDate date]];
    
    return
    selfDateComponenets.year  == todayDateComponenets.year  &&
    selfDateComponenets.month == todayDateComponenets.month && 
    selfDateComponenets.day   == todayDateComponenets.day;
}

@end

@implementation NSDate (HRDateComponents)

@end

@implementation NSDate (HRDateFactory)

-(nonnull NSDate *)hrDateAfterDays:(NSInteger)days {
    return [self dateByAddingTimeInterval:HRDateSecondsInDay * days];
}

-(nonnull NSDate *)hrYesterday {
    return [self hrDateAfterDays:-1];
}

-(nonnull NSDate *)hrTomorrow {
    return [self hrDateAfterDays:1];
}

+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string
                      withDateFormat:(nonnull NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [self _hrDateFormatterWithDateFormat:dateFormat];
    return [dateFormatter dateFromString:string];
}

+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string
                       withDateStyle:(NSDateFormatterStyle)dateStyle
                        andTimeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *dateFormatter = [self _hrDateFormatterWithDateStyle:dateStyle andTimeStyle:timeStyle];
    return [dateFormatter dateFromString:string];
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
