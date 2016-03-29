//
//  NSCalendar+HRUTCCalendar.h
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const _Nonnull NSCalendarHRUTCCalendarUTCKey;

@interface NSCalendar (HRUTCCalendar)

+(nonnull instancetype)hrUTCCalendar;

@end
