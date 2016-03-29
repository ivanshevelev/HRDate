//
//  NSDateComponents+HRAllComponents.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import "NSDateComponents+HRAllComponents.h"
#import "NSCalendar+HRUTCCalendar.h"

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
    NSCalendarUnitQuarter |
    NSCalendarUnitWeekOfMonth |
    NSCalendarUnitWeekOfYear |
    NSCalendarUnitYearForWeekOfYear |
    NSCalendarUnitNanosecond |
    NSCalendarUnitCalendar |
    NSCalendarUnitTimeZone;
    
    return [calendar components:unitFlags fromDate:date];
    
}

+(nonnull instancetype)hrUTCAllComponentsFromDate:(nonnull NSDate *)date {
    return [self hrAllComponentsFromCalendar:[NSCalendar hrUTCCalendar]
                                     andDate:date];
    
}

@end
