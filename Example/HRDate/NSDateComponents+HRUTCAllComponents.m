//
//  NSDateComponents+HRUTCAllComponents.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import "NSDateComponents+HRUTCAllComponents.h"
#import "NSCalendar+HRUTCCalendar.h"

@implementation NSDateComponents (HRUTCAllComponents)

+(nonnull instancetype)hrUTCAllComponentsFromDate:(nonnull NSDate *)date {
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
    
    return [[NSCalendar hrUTCCalendar] components:unitFlags
                                         fromDate:date];
    
}

@end
