//
//  AppDelegate.m
//  Routine
//
//  Created by Miles Hollingsworth on 5/23/14.
//  Copyright (c) 2014 Miles Hollingsworth. All rights reserved.
//

#import "ROUAppDelegate.h"
#import "ROUStatusItemController.h"
#import "ROUTaskStore.h"

@interface ROUAppDelegate ()

@property (strong, nonatomic) ROUStatusItemController *menubarController;

@end

@implementation ROUAppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.menubarController = [[ROUStatusItemController alloc] initWithWindowController:_panelWindowController];
}

// Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window
{
    return [[ROUTaskStore sharedStore].context undoManager];
}

// Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
- (IBAction)saveAction:(id)sender
{
    NSError *error = nil;
    
    if (![[ROUTaskStore sharedStore].context commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
    }
    
    if (![[ROUTaskStore sharedStore].context save:&error]) {
        [[NSApplication sharedApplication] presentError:error];
    }
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    // Save changes in the application's managed object context before the application terminates.
    
    if (![ROUTaskStore sharedStore].context) {
        return NSTerminateNow;
    }
    
    if (![[ROUTaskStore sharedStore].context commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
        return NSTerminateCancel;
    }
    
    if (![[ROUTaskStore sharedStore].context hasChanges]) {
        return NSTerminateNow;
    }
    
    NSError *error = nil;
    if (![[ROUTaskStore sharedStore].context save:&error]) {

        // Customize this code block to include application-specific recovery steps.              
        BOOL result = [sender presentError:error];
        if (result) {
            return NSTerminateCancel;
        }

        NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
        NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
        NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
        NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:question];
        [alert setInformativeText:info];
        [alert addButtonWithTitle:quitButton];
        [alert addButtonWithTitle:cancelButton];

        NSInteger answer = [alert runModal];
        
        if (answer == NSAlertAlternateReturn) {
            return NSTerminateCancel;
        }
    }

    return NSTerminateNow;
}

@end
