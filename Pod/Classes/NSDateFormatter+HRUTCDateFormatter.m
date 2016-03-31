//
//  NSDateFormatter+HRUTCDateFormatter.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import "NSDateFormatter+HRUTCDateFormatter.h"
#import "NSTimeZone+HRUTCTimeZone.h"
#import "NSCalendar+HRUTCCalendar.h"

@implementation NSDateFormatter (HRUTCDateFormatter)

+(nonnull instancetype)hrUTCDateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [NSCalendar hrUTCCalendar];
    dateFormatter.timeZone = [NSTimeZone hrUTCTimeZone];
    return dateFormatter;
}

@end
