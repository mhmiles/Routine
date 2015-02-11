//
//  NSDate+Midnight.m
//  Routine
//
//  Created by Miles Hollingsworth on 2/6/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import "NSDate+Midnight.h"

@implementation NSDate (Midnight)

+(NSDate *)dateAtBeginningOfToday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    calendar.timeZone = timeZone;
    
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
                                              fromDate:[self date]];
    
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    
    NSDate *beginningOfDay = [calendar dateFromComponents:components];
    return beginningOfDay;
}

@end
