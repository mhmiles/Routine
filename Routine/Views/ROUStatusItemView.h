//
//  StatusItemView.h
//  Routine
//
//  Created by Miles Hollingsworth on 5/23/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ROUStatusItemController;

extern const CGFloat statusItemWidth;

@interface ROUStatusItemView : NSView

@property (strong, nonatomic) NSImage *defaultImage;
@property (strong, nonatomic) NSImage *defaultHighlightImage;
@property (strong, nonatomic) NSImage *activeImage;
@property (strong, nonatomic) NSImage *activeHighlightImage;
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (nonatomic, getter = isActive) BOOL active;
@property (nonatomic, getter = isHighlighted) BOOL highlighted;

- (instancetype)initWithStatusItem:(NSStatusItem *)statusItem andStatusItemController:(ROUStatusItemController *)statusItemController;

@end
