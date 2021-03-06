//
//  NSTimeZone+HRUTCTimeZone.h
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const _Nonnull NSTimeZoneHRUTCTimeZoneUTCKey;

@interface NSTimeZone (HRUTCTimeZone)

/**
 *  The UTC Time Zone.
 *
 *  @return NSTimeZone instance with "UTC" timeZone name.
 */
+(nonnull instancetype)hrUTCTimeZone;

@end
