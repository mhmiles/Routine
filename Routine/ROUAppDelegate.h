//
//  AppDelegate.h
//  Routine
//
//  Created by Miles Hollingsworth on 5/23/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ROUPanelWindowController;

@interface ROUAppDelegate : NSObject <NSApplicationDelegate>

@property (strong) IBOutlet NSWindow *window;
@property (strong, nonatomic) IBOutlet ROUPanelWindowController *panelWindowController;

- (IBAction)saveAction:(id)sender;

@end
