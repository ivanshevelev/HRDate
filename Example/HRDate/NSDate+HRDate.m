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

@implementation NSDate (HRDateCompare)

-(BOOL)hrIsToday {
    NSDateComponents *selfDateComponenets = [NSDateComponents hrUTCAllComponentsFromDate:self];
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
@end

@implementation NSDate (HRDateString)

-(nullable NSString *)hrDateStringWithDateFormat:(nonnull NSString *)dateFormat {
    NSParameterAssert(dateFormat);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}

-(nonnull NSString *)hrDateStringWithDateStyle:(NSDateFormatterStyle)dateStyle
                                  andTimeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = dateStyle;
    dateFormatter.timeStyle = timeStyle;
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}

@end
