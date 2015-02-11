//
//  PanelView.m
//  Routine
//
//  Created by Miles Hollingsworth on 5/25/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//

#import "ROUPanelView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ROUPanelView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor whiteColor] setFill];
    
    if (CGRectContainsRect(dirtyRect, self.frame)) {
        CGPathRef popupPath = [self popupPathForRect:dirtyRect
                                              radius:5.0];
        
        CGContextRef context = [NSGraphicsContext currentContext].CGContext;
        CGContextAddPath(context, popupPath);
        CGContextFillPath(context);
        
        CGPathRelease(popupPath);
    } else {
        NSRectFill(dirtyRect);
    }
    

}

- (CGPathRef) popupPathForRect:(CGRect)rect radius:(CGFloat)radius
{
	CGMutablePathRef mutablePath = CGPathCreateMutable();
    
	CGRect innerRect = CGRectInset(rect, radius, radius);
    
    CGFloat outerTop = CGRectGetMaxY(rect)-8.0;
    CGFloat outerRight = CGRectGetMaxX(rect);
    CGFloat outerBottom = rect.origin.y;
    CGFloat outerLeft = rect.origin.x;

    CGFloat innerTop = CGRectGetMaxY(innerRect)-20.0;
    CGFloat innerRight = CGRectGetMaxX(innerRect);
    CGFloat innerBottom = innerRect.origin.y;
    CGFloat innerLeft = innerRect.origin.x;
    
    
    CGSize arrowSize = CGSizeMake(20.0, 10.0);
    CGFloat arrowLeft = CGRectGetMidX(rect) - arrowSize.width/2;
    CGFloat arrowTop = CGRectGetMaxY(rect);
    CGFloat arrowRight = CGRectGetMidX(rect) + arrowSize.width/2;

	CGPathMoveToPoint(mutablePath, NULL, innerLeft, outerBottom);
    
	CGPathAddLineToPoint(mutablePath, NULL, innerRight, outerBottom);
	CGPathAddArcToPoint(mutablePath, NULL, outerRight, outerBottom, outerRight, innerBottom, radius);
	CGPathAddLineToPoint(mutablePath, NULL, outerRight, innerBottom);
	CGPathAddArcToPoint(mutablePath, NULL,  outerRight, outerTop, innerRight, outerTop, radius);
    
    CGPathAddLineToPoint(mutablePath, NULL, arrowRight, outerTop);
    CGPathAddLineToPoint(mutablePath, NULL, CGRectGetMidX(rect), arrowTop);
    CGPathAddLineToPoint(mutablePath, NULL, arrowLeft, outerTop);
    
	CGPathAddLineToPoint(mutablePath, NULL, innerLeft, outerTop);
	CGPathAddArcToPoint(mutablePath, NULL,  outerLeft, outerTop, outerLeft, innerTop, radius);
	CGPathAddLineToPoint(mutablePath, NULL, outerLeft, innerBottom);
	CGPathAddArcToPoint(mutablePath, NULL,  outerLeft, outerBottom, innerLeft, outerBottom, radius);
    
	CGPathCloseSubpath(mutablePath);
    
    CGPathRef path = CGPathCreateCopy(mutablePath);
    CGPathRelease(mutablePath);
    
	return path;
}

@end
