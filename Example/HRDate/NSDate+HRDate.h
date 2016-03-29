//
//  NSDate+HRDate.h
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Count of hours in day.
 */
extern NSUInteger const HRDateHoursInDay;


/**
 *  Count of minutes in hour.
 */
extern NSUInteger const HRDateMinutesInHour;

/**
 *  Count of minutes in day.
 */
extern NSUInteger const HRDateMinutesInDay;


/**
 *  Count of seconds in minute.
 */
extern NSUInteger const HRDateSecondsInMinute;

/**
 *  Count of seconds in hour.
 */
extern NSUInteger const HRDateSecondsInHour;

/**
 *  Count of seconds in day.
 */
extern NSUInteger const HRDateSecondsInDay;

/**
 *  Category for compare dates.
 */
@interface NSDate (HRDateCompare)

/**
 *  Check two days for day, month and year.
 *
 *  @param date to match date.
 *
 *  @return Dates is equal for day, month and year or not.
 */
-(BOOL)hrIsEqualToDateIgnoringTime:(nonnull NSDate *)date;

/**
 *  Checking date is today or not.
 *
 *  @return date is today or not.
 */
-(BOOL)hrIsToday;

/**
 *  Checking date is tomorrow or not.
 *
 *  @return date is tomorrow or not.
 */
-(BOOL)hrIsTomorrow;

/**
 *  Checking date is yesterday or not.
 *
 *  @return date is yesterday or not.
 */
-(BOOL)hrIsYesterday;

@end

/**
 *  Category for get date components from the date.
 */
@interface NSDate (HRDateComponents)

/**
 *  Era of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrEra;


/**
 *  Day of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrDay;

/**
 *  Month of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrMonth;

/**
 *  Year of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrYear;

/**
 *  Hour of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrHour;

/**
 *  Minute of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrMinute;

/**
 *  Second of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrSecond;

/**
 *  Weekday of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrWeekday;

/**
 *  Weekday ordinal of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrWeekdayOrdinal;


/**
 *  Week of month of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrWeekOfMonth;

/**
 *  Week of year of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrWeekOfYear;

/**
 *  Year for week of year of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrYearForWeekOfYear;


/**
 *  nanoseconds of date. From NSDateComponents.
 */
@property (nonatomic, readonly) NSInteger hrNanosecond;


/**
 *  timeZone of date. From NSDateComponents.
 */
@property (nonatomic, readonly, nonnull) NSTimeZone *hrTimeZone;

/**
 *  Calendar of date. From NSDateComponents.
 */
@property (nonatomic, readonly, nonnull) NSCalendar *hrCalendar;

@end

/**
 *  Category for creating dates.
 */
@interface NSDate (HRDateFactory)

/**
 *  Factory method for create new date after days.
 *
 *  @param days Days count.
 *
 *  @return NSDate instance.
 */
-(nonnull NSDate *)hrDateAfterDays:(NSInteger)days;

/**
 *  Factory method for create new yesterday date.
 *
 *  @return NSDate instance.
 */
+(nonnull NSDate *)hrYesterday;

/**
 *  Factory method for create new tomorrow date.
 *
 *  @return NSDate instance.
 */
+(nonnull NSDate *)hrTomorrow;

/**
 *  Date from string parsing.
 *
 *  @param string     Date string.
 *  @param dateFormat Date format for parsing.
 *
 *  @return NSDate instance.
 */
+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string
                      withDateFormat:(nonnull NSString *)dateFormat;

/**
 *  Date from string parsing.
 *
 *  @param string    Date string.
 *  @param dateStyle Style for date parsing.
 *  @param timeStyle Style for time parsing.
 *
 *  @return NSDate instance.
 */
+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string
                       withDateStyle:(NSDateFormatterStyle)dateStyle
                        andTimeStyle:(NSDateFormatterStyle)timeStyle;

@end

/**
 *  Category for get date string representation from the date.
 */
@interface NSDate (HRDateString)

/**
 *  Date string from the date.
 *
 *  @param dateFormat Date format for date string representation.
 *
 *  @return NSString instance.
 */
-(nullable NSString *)hrDateStringWithDateFormat:(nonnull NSString *)dateFormat;

/**
 *  Date string from the date.
 *
 *  @param dateStyle Style for date part of string representation.
 *  @param timeStyle Style for time part of string representation.
 *
 *  @return NSString instance.
 */
-(nonnull NSString *)hrDateStringWithDateStyle:(NSDateFormatterStyle)dateStyle
                                  andTimeStyle:(NSDateFormatterStyle)timeStyle;

@end
