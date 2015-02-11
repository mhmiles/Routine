//
//  ROUTask.h
//  Routine
//
//  Created by Miles Hollingsworth on 2/6/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ROUEvent;

@interface ROUTask : NSManagedObject

@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSNumber * startTime;
@property (strong, nonatomic) NSNumber * interval;
@property (strong, nonatomic) NSNumber * repititions;
@property (strong, nonatomic) NSNumber * validDays;
@property (strong, nonatomic) NSOrderedSet *events;
@end

@interface ROUTask (CoreDataGeneratedAccessors)

- (void)insertObject:(ROUEvent *)value inEventsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromEventsAtIndex:(NSUInteger)idx;
- (void)insertEvents:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeEventsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInEventsAtIndex:(NSUInteger)idx withObject:(ROUEvent *)value;
- (void)replaceEventsAtIndexes:(NSIndexSet *)indexes withEvents:(NSArray *)values;
- (void)addEventsObject:(ROUEvent *)value;
- (void)removeEventsObject:(ROUEvent *)value;
- (void)addEvents:(NSOrderedSet *)values;
- (void)removeEvents:(NSOrderedSet *)values;
@end
