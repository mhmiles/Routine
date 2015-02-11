//
//  PanelWindow.m
//  Routine
//
//  Created by Miles Hollingsworth on 5/25/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//

#import "ROUPanelWindow.h"
#import "ROUPanelView.h"

@implementation ROUPanelWindow

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)aStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)flag {
    // Using NSBorderlessWindowMask results in a window without a title bar.
    self = [super initWithContentRect:contentRect
                            styleMask:NSBorderlessWindowMask
                              backing:NSBackingStoreBuffered
                                defer:NO];
    
    if (self) {
        // Start with no transparency for all drawing into the window
        [self setAlphaValue:1.0];
        // Turn off opacity so that the parts of the window that are not drawn into are transparent.
        [self setOpaque:NO];
        [self setBackgroundColor:[NSColor clearColor]];
        [self setLevel:NSStatusWindowLevel];
    }
    
    return self;
}

- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (void)setFrame:(NSRect)frameRect display:(BOOL)flag {
    [super setFrame:frameRect
            display:flag];
    
    [_panelView setFrame:CGRectMake(0.0, 0.0, frameRect.size.width, frameRect.size.height)];
}

@end
