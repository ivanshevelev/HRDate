//
//  NSDateComponents+HRAllComponents.h
//  HRDate
//
//  Created by Ivan Shevelev on 29/03/16.
//  Copyright © 2016 Ivan Shevelev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateComponents (HRAllComponents)

+(nonnull instancetype)hrAllComponentsFromCalendar:(nonnull NSCalendar *)calendar
                                           andDate:(nonnull NSDate *)date;
+(nonnull instancetype)hrUTCAllComponentsFromDate:(nonnull NSDate *)date;

@end
