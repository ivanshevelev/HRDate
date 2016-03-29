//
//  HRDateComponentsTests.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDateComponents+HRAllComponents.h"
#import "NSDate+HRDate.h"

@interface HRDateComponentsTests : XCTestCase

@property (nonatomic, strong, nonnull) NSDate *date;
@property (nonatomic, strong, nonnull) NSDateComponents *dateComponents;

@end

@implementation HRDateComponentsTests

-(void)setUp {
    [super setUp];
    self.date = [NSDate date];
    self.dateComponents = [NSDateComponents hrUTCAllComponentsFromDate:self.date];
}

-(void)testNanosecond {
//    can't be tested.
//    NSDate *date = [NSDate date];
//    NSDateComponents *dateComponents = [NSDateComponents hrUTCAllComponentsFromDate:date];
//    XCTAssert(date.hrNanosecond == dateComponents.nanosecond);
}

-(void)testEra {
    XCTAssert(self.date.hrEra == self.dateComponents.era);
}

-(void)testDay {
    XCTAssert(self.date.hrDay == self.dateComponents.day);
}

-(void)testMonth {
    XCTAssert(self.date.hrMonth == self.dateComponents.month);
}

-(void)testYear {
    XCTAssert(self.date.hrYear == self.dateComponents.year);
}

-(void)testHour {
    XCTAssert(self.date.hrHour == self.dateComponents.hour);
}

-(void)testMinute {
    XCTAssert(self.date.hrMinute == self.dateComponents.minute);
}

-(void)testSecond {
    XCTAssert(self.date.hrSecond == self.dateComponents.second);
}

-(void)testWeekday {
    XCTAssert(self.date.hrWeekday == self.dateComponents.weekday);
}

-(void)testWeekdayOrdinal {
    XCTAssert(self.date.hrWeekdayOrdinal == self.dateComponents.weekdayOrdinal);
}

-(void)testWeekOfMonth {
    XCTAssert(self.date.hrWeekOfMonth == self.dateComponents.weekOfMonth);
}

-(void)testWeekOfYear {
    XCTAssert(self.date.hrWeekOfYear == self.dateComponents.weekOfYear);
}

-(void)testYearForWeekOfYear {
    XCTAssert(self.date.hrYearForWeekOfYear == self.dateComponents.yearForWeekOfYear);
}

@end
