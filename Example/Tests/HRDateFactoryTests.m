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

@end
