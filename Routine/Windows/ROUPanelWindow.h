//
//  PanelWindow.h
//  Routine
//
//  Created by Miles Hollingsworth on 5/25/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ROUPanelView;

@interface ROUPanelWindow : NSWindow

@property (strong, nonatomic) IBOutlet ROUPanelView *panelView;

@end
