//
//  HRDateFactoryTests.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <HRDate/HRDate.h>

@interface HRDateFactoryTests : XCTestCase

@property (nonnull, nonatomic, strong) NSDate *date;

@end

@implementation HRDateFactoryTests

- (void)setUp {
    [super setUp];
    self.date = [NSDate date];
}

-(void)testTomorrow {
    NSDate *dateAfterDays = [self.date hrDateAfterDays:1];
    XCTAssert([dateAfterDays hrIsTomorrow]);
}

-(void)testYesterday {
    NSDate *dateAfterDays = [self.date hrDateAfterDays:-1];
    XCTAssert([dateAfterDays hrIsYesterday]);
}

-(void)testDateFromStringWithDateFormat {
    NSString *dateFormat = @"dd.MM.yyyy";
    NSString *str = [self.date hrDateStringWithDateFormat:dateFormat];
    XCTAssert(str);
    NSDate *date = [NSDate hrDateFromString:str withDateFormat:dateFormat];
    XCTAssert([self.date hrIsEqualToDateIgnoringTime:date]);
    NSString *mbStr = [date hrDateStringWithDateFormat:dateFormat];
    XCTAssert(mbStr);
    XCTAssert([mbStr isEqualToString:str]);
}

-(void)testDateFromStringWithStyles {
    NSDateFormatterStyle dateStyle = NSDateFormatterShortStyle;
    NSDateFormatterStyle timeStyle = NSDateFormatterShortStyle;
    
    NSString *str = [self.date hrDateStringWithDateStyle:dateStyle andTimeStyle:timeStyle];
    XCTAssert(str);
    NSDate *date = [NSDate hrDateFromString:str withDateStyle:dateStyle andTimeStyle:timeStyle];
    XCTAssert([self.date hrIsEqualToDateIgnoringTime:date]);
    NSString *mbStr = [date hrDateStringWithDateStyle:dateStyle andTimeStyle:timeStyle];
    XCTAssert(mbStr);
    XCTAssert([mbStr isEqualToString:str]);
}

-(void)testDateByWithoutTimeComponents {
    NSInteger day = self.date.hrDay;
    NSInteger month = self.date.hrMonth;
    NSInteger year = self.date.hrYear;
    
    NSDate *createdDate = [NSDate hrDateWithDay:day
                                           month:month
                                         andYear:year];
    
    XCTAssert(createdDate.hrHour == 0 &&
              createdDate.hrMinute == 0 &&
              createdDate.hrSecond == 0 &&
              createdDate.hrDay == day &&
              createdDate.hrMonth == month &&
              createdDate.hrYear == year);
}

-(void)testDateByTimeComponents {
    NSInteger hour = self.date.hrHour;
    NSInteger minute = self.date.hrMinute;
    NSInteger second = self.date.hrSecond;
    NSInteger day = self.date.hrDay;
    NSInteger month = self.date.hrMonth;
    NSInteger year = self.date.hrYear;
    
    NSDate *createdDate = [NSDate hrDateWithHour:hour
                                          minute:minute
                                          second:second
                                             day:day
                                           month:month
                                         andYear:year];
    XCTAssert(createdDate.hrHour == hour &&
              createdDate.hrMinute == minute &&
              createdDate.hrSecond == second &&
              createdDate.hrDay == day &&
              createdDate.hrMonth == month &&
              createdDate.hrYear == year);
}

-(void)testHourDifference {
    
    NSInteger hour = self.date.hrHour;
    NSInteger minute = self.date.hrMinute;
    NSInteger second = self.date.hrSecond;
    NSInteger day = self.date.hrDay;
    NSInteger month = self.date.hrMonth;
    NSInteger year = self.date.hrYear;
    
    NSDate *dateAfterHours = [NSDate hrDateWithHourDifference:-1];
    if (dateAfterHours.hrHour != 0) {
        XCTAssert(dateAfterHours.hrHour == hour - 1 &&
                  dateAfterHours.hrMinute == minute &&
                  dateAfterHours.hrSecond == second &&
                  dateAfterHours.hrDay == day &&
                  dateAfterHours.hrMonth == month &&
                  dateAfterHours.hrYear == year);
    } else {
        XCTAssert(dateAfterHours.hrHour == 23 &&
                  dateAfterHours.hrMinute == minute &&
                  dateAfterHours.hrSecond == second &&
                  dateAfterHours.hrDay == day &&
                  dateAfterHours.hrMonth == month &&
                  dateAfterHours.hrYear == year);
    }
}

-(void)testAfterHours {
    NSInteger hour = 22;
    NSInteger minute = 0;
    NSInteger second = 0;
    NSInteger day = 31;
    NSInteger month = 03;
    NSInteger year = 2016;
    
    NSDate *createdDate = [NSDate hrDateWithHour:hour
                                          minute:minute
                                          second:second
                                             day:day
                                           month:month
                                         andYear:year];
    
    NSDate *dateAfterHours = [createdDate hrDateAfterHours:-1];
    XCTAssert(dateAfterHours.hrHour == hour - 1 &&
              dateAfterHours.hrMinute == minute &&
              dateAfterHours.hrSecond == second &&
              dateAfterHours.hrDay == day &&
              dateAfterHours.hrMonth == month &&
              dateAfterHours.hrYear == year);
}

@end
