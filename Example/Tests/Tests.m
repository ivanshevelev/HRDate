//
//  HRDateTests.m
//  HRDateTests
//
//  Created by Ivan Shevelev on 03/29/2016.
//  Copyright (c) 2016 Ivan Shevelev. All rights reserved.
//

@import XCTest;
#import <HRDate/HRDate.h>

@interface Tests : XCTestCase

@property (nonatomic, strong, nullable) NSDate *date;

@end

@implementation Tests

-(void)setUp {
    [super setUp];
    self.date = [NSDate date];
}

- (void)testIsToday
{
    XCTAssert([self.date hrIsToday]);
}

-(void)testTomorrow {
    NSDate *dateAfterDays = [self.date hrDateAfterDays:1];
    NSDate *tomorrow = [NSDate hrTomorrow];
    XCTAssert([tomorrow hrIsEqualToDateIgnoringTime:dateAfterDays]);
}

-(void)testYesterday {
    NSDate *dateAfterDays = [self.date hrDateAfterDays:-1];
    NSDate *yesterday = [NSDate hrYesterday];
    XCTAssert([yesterday hrIsEqualToDateIgnoringTime:dateAfterDays]);
}


@end

