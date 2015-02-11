//
//  StatusItemView.m
//  Routine
//
//  Created by Miles Hollingsworth on 5/23/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//

#import "ROUStatusItemView.h"
#import "ROUStatusItemController.h"
#import "ROUIconView.h"

const CGFloat statusItemWidth = 30.0;

@interface ROUStatusItemView ()

@property (weak, nonatomic) ROUStatusItemController *statusItemController;
@property (strong, nonatomic) ROUIconView *iconView;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ROUStatusItemView

#pragma mark -

-(void)drawRect:(NSRect)dirtyRect {
    [_statusItem drawStatusBarBackgroundInRect:self.bounds
                                 withHighlight:self.isHighlighted];
}

- (instancetype)initWithStatusItem:(NSStatusItem *)statusItem andStatusItemController:(ROUStatusItemController *)statusItemController{
    if (self = [super init]) {
        _statusItem = statusItem;
        _statusItemController = statusItemController;
        
        _iconView = [[ROUIconView alloc] init];
        _iconView.translatesAutoresizingMaskIntoConstraints = NO;
        _iconView.active = YES;
        
        [_iconView addConstraint:[NSLayoutConstraint constraintWithItem:_iconView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:_iconView
                                                            attribute:NSLayoutAttributeWidth
                                                           multiplier:1.0
                                                             constant:0.0]];
        [self addSubview:_iconView];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-4-[_iconView]-4-|"
                                                                    options:NSLayoutFormatAlignAllCenterX
                                                                    metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(_iconView)]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[_iconView]"
                                                                     options:NSLayoutFormatAlignAllCenterY
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(_iconView)]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_iconView
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0
                                                          constant:0.0]];
    }
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    _iconView.highlighted = highlighted;
    
    [self setNeedsDisplay:YES];
}

#pragma mark Mouse tracking

- (void)mouseDown:(NSEvent *)theEvent {
    [_statusItemController handleClickEvent:theEvent];

    [self setNeedsDisplay:YES];
}

- (void)rightMouseDown:(NSEvent *)theEvent {
    [self toggleActive];
    [self toggleFlashing];
}

- (void)toggleActive {
    _iconView.active = !_iconView.isActive;
    [self setNeedsDisplay:YES];
}

- (void)toggleFlashing {
    if (_timer) {
        self.active = NO;
        [self.timer invalidate];
        self.timer = nil;
    } else {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(toggleActive) userInfo:nil repeats:YES];
    }
}

@end
