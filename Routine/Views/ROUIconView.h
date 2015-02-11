//
//  ROUIconView.h
//  Routine
//
//  Created by Miles Hollingsworth on 2/6/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ROUIconView : NSView

@property (nonatomic, getter = isActive) BOOL active;
@property (nonatomic, getter = isHighlighted) BOOL highlighted;

@end
