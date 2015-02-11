//
//  MenubarController.m
//  Routine
//
//  Created by Miles Hollingsworth on 5/23/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//



#import "ROUStatusItemController.h"
#import "ROUStatusItemView.h"
#import "ROUPanelWindowController.h"
#import "ROUPanelWindow.h"

@interface ROUStatusItemController ()

@property (strong, nonatomic) ROUStatusItemView *statusItemView;

@end

@implementation ROUStatusItemController

- (instancetype)initWithWindowController:(ROUPanelWindowController *)windowController {
    if (self = [super init]) {
        self.panelWindowController = windowController;
        self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:statusItemWidth];
        
        _statusItemView = [[ROUStatusItemView alloc] initWithStatusItem:_statusItem
                                                andStatusItemController:self];
        
        _statusItem.view = _statusItemView;
    }

    return self;
}

- (void)handleClickEvent:(NSEvent *)theEvent {
//    [[NSRunLoop mainRunLoop] acceptInputForMode:NSEventTrackingRunLoopMode beforeDate:[NSDate date]];
    
    NSWindow *panelWindow = _panelWindowController.window;
    CGRect statusItemFrame = [(NSWindow *)[_statusItem valueForKey:@"window"] frame];
    CGSize panelWindowSize = panelWindow.frame.size;
    CGRect newPanelWindowFrame = CGRectMake(CGRectGetMidX(statusItemFrame)-panelWindowSize.width/2, CGRectGetMinY(statusItemFrame)-panelWindowSize.height-2, panelWindowSize.width, panelWindowSize.height);
    [panelWindow setFrame:newPanelWindowFrame display:NO];
    
    _statusItemView.highlighted = !_statusItemView.isHighlighted;
    
    if (_statusItemView.isHighlighted) {
        [_panelWindowController.window makeKeyAndOrderFront:self];
    } else {
        [_panelWindowController.window orderOut:self];
    }
}

@end
