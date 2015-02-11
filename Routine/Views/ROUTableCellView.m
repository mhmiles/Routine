//
//  ROUTableCellView.m
//  Routine
//
//  Created by Miles Hollingsworth on 2/6/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import "ROUTableCellView.h"
#import "ROUIconView.h"

@interface ROUTableCellView ()

@property (weak, nonatomic) IBOutlet ROUIconView *iconView;

@end

@implementation ROUTableCellView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [_iconView bind:@"startTime"
           toObject:self
        withKeyPath:@"objectValue.startTime"
            options:nil];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
