//
//  NSDateFormatter+HRUTCDateFormatter.h
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (HRUTCDateFormatter)

/**
 *  The date formatter with UTC time zone.
 *
 *  @return NSDateFormatter instance.
 */
+(nonnull instancetype)hrUTCDateFormatter;

@end
