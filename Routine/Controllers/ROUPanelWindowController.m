//
//  PanelController.m
//  Routine
//
//  Created by Miles Hollingsworth on 5/23/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//

#import "ROUPanelWindowController.h"
#import "ROUPanelView.h"
#import "ROUTaskStore.h"

@interface ROUPanelWindowController () <NSTableViewDelegate, NSTextFieldDelegate>

@property (strong) IBOutlet NSArrayController *taskArrayController;
@property (weak) IBOutlet NSTableView *tableView;

@end

@implementation ROUPanelWindowController

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return YES;
}

-(NSManagedObjectContext *)managedObjectContext {
    return [ROUTaskStore sharedStore].context;
}

- (IBAction)nameDidReturn:(id)sender {
    [self.window makeFirstResponder:self.tableView];
}

@end