//
//  HRDateTests.m
//  HRDateTests
//
//  Created by Ivan Shevelev on 03/29/2016.
//  Copyright (c) 2016 Ivan Shevelev. All rights reserved.
//

@import XCTest;
#import "NSDate+HRDate.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)testIsToday
{
    NSDate *date = [NSDate date];
    XCTAssert([date hrIsToday]);
}

@end

