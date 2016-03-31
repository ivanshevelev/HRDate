# HRDate

[![Version](https://img.shields.io/cocoapods/v/HRDate.svg?style=flat)](http://cocoapods.org/pods/HRDate)
[![License](https://img.shields.io/cocoapods/l/HRDate.svg?style=flat)](http://cocoapods.org/pods/HRDate)
[![Platform](https://img.shields.io/cocoapods/p/HRDate.svg?style=flat)](http://cocoapods.org/pods/HRDate)

Forget about NSDateFormatter, NSDateComponents, NSTimeZone brainf%ck for get simple data from NSDate. 
HRDate is a simple API for NSDate!

## Usage

Constants(like a seconds in hour):
```objective-c
extern NSUInteger const HRDateHoursInDay;
extern NSUInteger const HRDateMinutesInHour;
extern NSUInteger const HRDateMinutesInDay;
extern NSUInteger const HRDateSecondsInMinute;
extern NSUInteger const HRDateSecondsInHour;
extern NSUInteger const HRDateSecondsInDay;
```

Date Comparing:
```objective-c
-(BOOL)hrIsEqualToDateIgnoringTime:(nonnull NSDate *)date;

-(BOOL)hrIsToday;

-(BOOL)hrIsTomorrow;

-(BOOL)hrIsYesterday;
```
Get ALL! date components from date:
```objective-c
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
@property (nonatomic, readonly) NSInteger hrWeekOfYear;
@property (nonatomic, readonly) NSInteger hrYearForWeekOfYear;
@property (nonatomic, readonly) NSInteger hrNanosecond;
@property (nonatomic, readonly, nonnull) NSTimeZone *hrTimeZone;
@property (nonatomic, readonly, nonnull) NSCalendar *hrCalendar;
```

A lot of NSDate new factory methods:
```objective-c
-(nonnull NSDate *)hrDateAfterDays:(NSInteger)days;

-(nonnull NSDate *)hrDateAfterHours:(NSInteger)hours;

+(nonnull NSDate *)hrYesterday;

+(nonnull NSDate *)hrTomorrow;

+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string withDateFormat:(nonnull NSString *)dateFormat;

+(nullable NSDate *)hrDateFromString:(nonnull NSString *)string withDateStyle:(NSDateFormatterStyle)dateStyle andTimeStyle:(NSDateFormatterStyle)timeStyle;

//this method is awesome!
+(nullable NSDate *)hrDateWithHour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second day:(NSUInteger)day month:(NSUInteger)month andYear:(NSUInteger)year;

//this method is awesome!
+(nullable NSDate *)hrDateWithDay:(NSUInteger)day month:(NSUInteger)month andYear:(NSUInteger)year;

+(nullable NSDate *)hrDateWithHourDifference:(NSInteger)hourDifference;
```
And date strings ofc:

```objective-c
-(nullable NSString *)hrDateStringWithDateFormat:(nonnull NSString *)dateFormat;

-(nonnull NSString *)hrDateStringWithDateStyle:(NSDateFormatterStyle)dateStyle andTimeStyle:(NSDateFormatterStyle)timeStyle;
```

For NSDateFormatter, NSTimeZone, NSDateComponents and NSCalendar features, see [documentation](http://cocoadocs.org/docsets/HRDate/0.1/).

## Requirements

iOS 8.0 or higher.

## Installation

HRDate is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod "HRDate"
```

## Author

Ivan Shevelev, ivan.shevelev@sibers.com

## License

HRDate is available under the MIT license. See the LICENSE file for more info.
