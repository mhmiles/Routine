//
//  ROUIconView.m
//  Routine
//
//  Created by Miles Hollingsworth on 2/6/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import "ROUIconView.h"
#import "ROUCircleView.h"
#import <QuartzCore/QuartzCore.h>

@interface ROUIconView ()

@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) ROUCircleView *innerView;
@property (strong, nonatomic) CAShapeLayer *innerLayer;

- (CGFloat)outerLineWidth;
- (void)setupLayer;
- (void)adjustLayerPath;
- (void)addInnerLayer;

@end

@implementation ROUIconView

+ (void)initialize {
    [self exposeBinding:@"startTime"];
}

- (instancetype)init {
    if (self = [super init]) {
        [self setupLayer];
        [self addInnerLayer];
    }
    
    return self;
}

- (void)awakeFromNib {

    [self setupLayer];
//    [self addInnerLayer];
}

- (void)layout {
    [super layout];
    
    [self adjustLayerPath];
}

- (void)setupLayer {
    CAShapeLayer *layer = [CAShapeLayer layer];
    self.layer = layer;
    self.wantsLayer = YES;
    
    layer.strokeColor = [NSColor blackColor].CGColor;
    layer.fillColor = [NSColor clearColor].CGColor;
}

- (void)adjustLayerPath {
    CAShapeLayer *layer = (CAShapeLayer *)self.layer;
    
    CGRect outerRect = CGRectInset(self.bounds, [self outerLineWidth]/2, [self outerLineWidth]/2);
    layer.path = CGPathCreateWithEllipseInRect(outerRect, NULL);
    layer.lineWidth = [self outerLineWidth];
}

- (CGFloat)outerLineWidth {
    CGFloat width = CGRectGetWidth(self.bounds);
    
    if (width) {
        return floorf(width*2*0.05)/2;
    } else {
        return 0.5;
    }
}

- (void)addInnerLayer {
    self.innerView = [[ROUCircleView alloc] init];
    _innerView.translatesAutoresizingMaskIntoConstraints = NO;
    _innerView.alphaValue = 0.0;
    
    [NSAnimationContext beginGrouping];
    
    [[NSAnimationContext currentContext] setDuration:10.0];
    [[self animator] addSubview:_innerView];
    [_innerView animator].alphaValue = 1.0;
    
    [NSAnimationContext endGrouping];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(padding)-[_innerView]-(padding)-|"
                                                                 options:0
                                                                 metrics:@{@"padding": @([self outerLineWidth]*4)}
                                                                   views:NSDictionaryOfVariableBindings(_innerView)]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(padding)-[_innerView]-(padding)-|"
                                                                 options:0
                                                                 metrics:@{@"padding": @([self outerLineWidth]*4)}
                                                                   views:NSDictionaryOfVariableBindings(_innerView)]];
}

- (void)setStartTime:(NSDate *)startTime {
    _startTime = startTime;
    
    NSLog(@"%@", startTime);
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    
    if (highlighted) {
        _innerView.backgroundColor = [NSColor whiteColor];
    } else {
        _innerView.backgroundColor = [NSColor blackColor];
    }
}

//- (void)drawRect:(NSRect)dirtyRect {
//    if (CGRectContainsRect(dirtyRect, self.bounds)) {
//        
//        NSColor *iconColor;
//        if (self.isHighlighted) {
//            iconColor = [NSColor whiteColor];
//        } else {
//            iconColor = [NSColor blackColor];
//        }
//        
//        [iconColor setStroke];
//        [iconColor setFill];
//        
//        CGFloat rectWidth = CGRectGetWidth(dirtyRect);
//        NSBezierPath *outerPath = [NSBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds, [self outerLineWidth]/2, [self outerLineWidth]/2)];
//        outerPath.lineWidth = [self outerLineWidth];
//        [outerPath stroke];
//    }
//}

@end
