//
//  NSDate+HRDate.h
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSUInteger const HRDateHoursInDay;

extern NSUInteger const HRDateMinutesInHour;
extern NSUInteger const HRDateMinutesInDay;

extern NSUInteger const HRDateSecondsInMinute;
extern NSUInteger const HRDateSecondsInHour;
extern NSUInteger const HRDateSecondsInDay;

@interface NSDate (HRDateCompare)

-(BOOL)hrIsToday;

@end

@interface NSDate (HRDateComponents)

@property (nonatomic, readonly) NSInteger hrEra;

@property (nonatomic, readonly) NSInteger hrDay;
@property (nonatomic, readonly) NSInteger hrMonth;
@property (nonatomic, readonly) NSInteger hrYear;

@property (nonatomic, readonly) NSInteger hrHour;
@property (nonatomic, readonly) NSInteger hrMinute;
@property (nonatomic, readonly) NSInteger hrSecond;

@property (nonatomic, readonly) NSInteger hrWeekday;
@property (nonatomic, readonly) NSInteger hrWeekdayOrdinal;

@property (nonatomic, readonly) NSInteger hrWeekOfMonth;
@property (nonatomic, readonly) NSInteger hrWeekdayOfYear;
@property (nonatomic, readonly) NSInteger hrYearForWeekOfYear;

@property (nonatomic, readonly) NSInteger hrNanosecond;

@property (nonatomic, readonly, nonnull) NSTimeZone *hrTimeZone;
@property (nonatomic, readonly, nonnull) NSCalendar *hrCalendar;

@end

@interface NSDate (HRDateFactory)

-(nonnull NSDate *)hrDateAfterDays:(NSInteger)days;
-(nonnull NSDate *)hrYesterday;
-(nonnull NSDate *)hrTomorrow;

+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string
                      withDateFormat:(nonnull NSString *)dateFormat;

+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string
                       withDateStyle:(NSDateFormatterStyle)dateStyle
                        andTimeStyle:(NSDateFormatterStyle)timeStyle;

@end

@interface NSDate (HRDateString)

-(nullable NSString *)hrDateStringWithDateFormat:(nonnull NSString *)dateFormat;

-(nonnull NSString *)hrDateStringWithDateStyle:(NSDateFormatterStyle)dateStyle
                                  andTimeStyle:(NSDateFormatterStyle)timeStyle;

@end
