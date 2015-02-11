//
//  ROUTextField.m
//  Routine
//
//  Created by Miles Hollingsworth on 2/6/15.
//  Copyright (c) 2015 Miles Hollingsworth. All rights reserved.
//

#import "ROUTextField.h"

@implementation ROUTextField

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.drawsBackground = NO;
    }
    
    return self;
}

@end
