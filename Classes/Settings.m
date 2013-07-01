//
//  Settings.m
//  nds4ios
//
//  Created by Developer on 6/30/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "Settings.h"

@interface Settings ()

@end

@implementation Settings

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"shiftPad"])
        shiftPad.on = true;
    else
        shiftPad.on = false;
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"hideControls"])
        hideControls.on = true;
    else
        hideControls.on = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideControlsPressed:(id)sender {
    if (hideControls.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hideControls"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hideControls"];
}

- (IBAction)shiftPadPressed:(id)sender {
    if (shiftPad.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"shiftPad"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"shiftPad"];
}

- (IBAction)closeWindow:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Everything with the S at the end is for iOS 7

- (IBAction)hideControlsS:(id)sender {
    if (hideControls.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hideControls"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hideControls"];
}

- (IBAction)shiftPadS:(id)sender {
    if (shiftPad.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"shiftPad"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"shiftPad"];
}

- (IBAction)closeWindowS:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidUnload {
    hideControls = nil;
    shiftPad = nil;
    [super viewDidUnload];
}
@end
