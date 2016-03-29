//
//  NSTimeZone+HRUTCTimeZone.m
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import "NSTimeZone+HRUTCTimeZone.h"

NSString * const NSTimeZoneHRUTCTimeZoneUTCKey = @"UTC";

@implementation NSTimeZone (HRUTCTimeZone)

+(instancetype)hrUTCTimeZone {
    return [NSTimeZone timeZoneWithName:NSTimeZoneHRUTCTimeZoneUTCKey];
}

@end
