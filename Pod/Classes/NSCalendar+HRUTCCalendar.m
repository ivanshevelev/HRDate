//
//  NSCalendar+HRUTCCalendar.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import "NSCalendar+HRUTCCalendar.h"
#import "NSTimeZone+HRUTCTimeZone.h"

@implementation NSCalendar (HRUTCCalendar)

+(instancetype)hrUTCCalendar {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    calendar.timeZone = [NSTimeZone hrUTCTimeZone];
    return calendar;
}

@end
