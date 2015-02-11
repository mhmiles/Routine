//
//  MenubarController.h
//  Routine
//
//  Created by Miles Hollingsworth on 5/23/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ROUPanelWindowController;

@interface ROUStatusItemController : NSObject

@property (strong, nonatomic) NSStatusItem *statusItem;
@property (strong, nonatomic) ROUPanelWindowController *panelWindowController;

- (instancetype)initWithWindowController:(ROUPanelWindowController *)windowController;
- (void)handleClickEvent:(NSEvent *)theEvent;

@end
