//
//  NSDateComponents+HRAllComponents.h
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateComponents (HRAllComponents)

/**
 *  The date components from the parameter calendar with all unit flags and UTC time zone.
 *
 *  @param calendar The calendar from u want get data
 *  @param date     The date from u want get data
 *
 *  @return NSDateComponents instance.
 */
+(nonnull instancetype)hrAllComponentsFromCalendar:(nonnull NSCalendar *)calendar
                                           andDate:(nonnull NSDate *)date;
/**
 *  The date components from UTC calendar with all unit flags and UTC time zone.
 *
 *  @param date The date from u want get data.
 *
 *  @return NSDateComponents instance.
 */
+(nonnull instancetype)hrUTCAllComponentsFromDate:(nonnull NSDate *)date;

@end
