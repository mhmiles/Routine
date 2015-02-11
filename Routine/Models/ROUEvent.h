//
//  ROUEvent.h
//  Routine
//
//  Created by Miles Hollingsworth on 2/5/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface ROUEvent : NSManagedObject

@property (strong, nonatomic) NSDate *timestamp;
@property (weak, nonatomic) NSManagedObject *task;
@property (nonatomic) BOOL completed;

@end
