//
//  NSCalendar+HRUTCCalendar.h
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (HRUTCCalendar)

/**
 *  Calendar with UTC time zone.
 *
 *  @return NSCalendar instance.
 */
+(nonnull instancetype)hrUTCCalendar;

@end
