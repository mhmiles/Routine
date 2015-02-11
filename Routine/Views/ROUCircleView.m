//
//  ROUCircleView.m
//  Routine
//
//  Created by Miles Hollingsworth on 2/7/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import "ROUCircleView.h"

@implementation ROUCircleView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    if (CGRectContainsRect(dirtyRect, self.bounds)) {
        if (_backgroundColor) {
            [_backgroundColor setFill];
        } else {
            [[NSColor blackColor] setFill];
        }
        
        NSBezierPath *path = [NSBezierPath bezierPathWithOvalInRect:dirtyRect];
        [path fill];
    }

}

@end
