//
//  ROUTaskStore.h
//  Routine
//
//  Created by Miles Hollingsworth on 2/5/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ROUTask;

@interface ROUTaskStore : NSObject

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSManagedObjectModel *model;

+ (instancetype)sharedStore;

- (void)loadAllTasks;
- (ROUTask *)createTask;
- (void)deleteTask:(ROUTask *)task;

@end
