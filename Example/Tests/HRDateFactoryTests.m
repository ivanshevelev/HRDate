//
//  HRDateFactoryTests.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+HRDate.h"

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

@end
