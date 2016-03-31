//
//  NSDateComponents+HRAllComponents.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import "NSDateComponents+HRAllComponents.h"
#import "NSCalendar+HRUTCCalendar.h"
#import "NSTimeZone+HRUTCTimeZone.h"

@implementation NSDateComponents (HRAllComponents)

+(nonnull instancetype)hrAllComponentsFromCalendar:(nonnull NSCalendar *)calendar
                                           andDate:(nonnull NSDate *)date {
    NSParameterAssert(calendar);
    NSParameterAssert(date);
    
    NSCalendarUnit unitFlags =
    NSCalendarUnitEra |
    NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond |
    NSCalendarUnitWeekday |
    NSCalendarUnitWeekdayOrdinal |
    NSCalendarUnitWeekOfMonth |
    NSCalendarUnitWeekOfYear |
    NSCalendarUnitYearForWeekOfYear |
    NSCalendarUnitNanosecond |
    NSCalendarUnitCalendar |
    NSCalendarUnitTimeZone;
    
    NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:date];
    dateComponents.timeZone = calendar.timeZone;
    
    return dateComponents;
    
}

+(nonnull instancetype)hrUTCAllComponentsFromDate:(nonnull NSDate *)date {
    return [self hrAllComponentsFromCalendar:[NSCalendar hrUTCCalendar]
                                     andDate:date];
    
}

+(nonnull instancetype)hrURCEmptyComponents {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.timeZone = [NSTimeZone hrUTCTimeZone];
    return dateComponents;
}

@end
