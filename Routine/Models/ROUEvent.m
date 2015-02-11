//
//  ROUEvent.m
//  Routine
//
//  Created by Miles Hollingsworth on 2/5/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import "ROUEvent.h"

@implementation ROUEvent

@dynamic timestamp, task, completed;

- (void)awakeFromInsert {
    [super awakeFromInsert];
    
    self.timestamp = [NSDate date];
}

@end
