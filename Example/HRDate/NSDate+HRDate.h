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

@property (nonatomic, readonly) NSUInteger hrDay;
@property (nonatomic, readonly) NSUInteger hrMonth;
@property (nonatomic, readonly) NSUInteger hrYear;

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
