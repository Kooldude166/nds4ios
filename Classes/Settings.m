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
    
    // Check if 'Disable Sound' is enabled.
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"disableSound"])
        disableSound.on = true;
    else
        disableSound.on = false;

    // Check if 'Hide Controls' is enabled.
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"hideControls"])
        hideControls.on = true;
    else
        hideControls.on = false;
    
    // Check if 'Shift Pad Down' is enabled.
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"shiftPad"])
        shiftPad.on = true;
    else
        shiftPad.on = false;
    
    // Check if 'Show FPS' is enabled.
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"showFPS"])
        showFPS.on = true;
    else
        showFPS.on = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)disableSoundPressed:(id)sender
{
    if (disableSound.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"disableSound"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"disableSound"];
}

- (IBAction)hideControlsPressed:(id)sender
{
    if (hideControls.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hideControls"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hideControls"];
}

- (IBAction)shiftPadPressed:(id)sender
{
    if (shiftPad.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"shiftPad"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"shiftPad"];
}

- (IBAction)setFPS:(id)sender
{
    if (showFPS.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"showFPS"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"showFPS"];
}

- (IBAction)closeWindow:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidUnload {
    hideControls = nil;
    shiftPad = nil;
    disableSound = nil;
    showFPS = nil;
    [super viewDidUnload];
}
@end
