//
//  ROUTaskStore.m
//  Routine
//
//  Created by Miles Hollingsworth on 2/5/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import "ROUTaskStore.h"
#import "ROUTask.h"

@interface ROUTaskStore ()

@property (strong, nonatomic) NSMutableArray *privateTasks;

@end

@implementation ROUTaskStore

+ (instancetype)sharedStore {
    static ROUTaskStore *sharedStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] init];
    });
    
    return sharedStore;
}

- (instancetype)init {
    if (self = [super init]) {
        _model = [NSManagedObjectModel mergedModelFromBundles:nil];
        
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
        
        NSError *error = nil;
        
        if (![coordinator addPersistentStoreWithType:NSSQLiteStoreType
                                       configuration:nil
                                                 URL:[[self applicationFilesDirectory] URLByAppendingPathComponent:@"Routine"]
                                             options:nil
                                               error:&error]) {
            @throw [NSException exceptionWithName:@"Database file loading error"
                                           reason:[error localizedDescription]
                                         userInfo:nil];
            
        }
        
        _context = [[NSManagedObjectContext alloc] init];
        _context.persistentStoreCoordinator = coordinator;
        
//        [self loadAllTasks];
    }
    
    return self;
}

// Returns the directory the application uses to store the Core Data store file.
- (NSURL *)applicationFilesDirectory
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *appSupportURL = [[fileManager URLsForDirectory:NSApplicationSupportDirectory
                                                inDomains:NSUserDomainMask] lastObject];
    
    NSURL *directoryURL = [appSupportURL URLByAppendingPathComponent:@"Routine"];
    
    if (![fileManager fileExistsAtPath:[directoryURL path]]) {
        NSError *error = nil;
        
        [fileManager createDirectoryAtURL:directoryURL
              withIntermediateDirectories:NO
                               attributes:nil
                                    error:&error];
    }
    
    return directoryURL;
}

- (BOOL)saveChanges {
    NSError *error = nil;
    BOOL successful = [self.context save:&error];
    
    if (!successful) {
        NSLog(@"Save error:\n%@:", [error localizedDescription]);
    }
    
    return successful;
}

//- (void)loadAllTasks {
//    if (!_privateTasks) {
//        NSFetchRequest *request = [[NSFetchRequest alloc] init];
//        NSEntityDescription *description = [NSEntityDescription entityForName:@"Task"
//                                                       inManagedObjectContext:_context];
//        request.entity = description;
//        
//        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"startTime"
//                                                                         ascending:YES];
//        request.sortDescriptors = @[sortDescriptor];
//        
//        NSError *error = nil;
//        
//        NSArray *result = [_context executeFetchRequest:request
//                                                  error:&error];
//        
//        if (!result) {
//            @throw [NSException exceptionWithName:@"Fetch failed"
//                                           reason:[error localizedDescription]
//                                         userInfo:nil];
//        }
//        
//        self.privateTasks = [result mutableCopy];
//    }
//}
//
//- (ROUTask *)createTask {
//    ROUTask *task = [NSEntityDescription insertNewObjectForEntityForName:@"ROUTask"
//                                                  inManagedObjectContext:_context];
//    
//    [self.privateTasks addObject:task];
//    
//    return task;
//}
//
//-(void)deleteTask:(ROUTask *)task {
//    [_context deleteObject:task];
//    [_privateTasks removeObjectIdenticalTo:task];
//}

@end
