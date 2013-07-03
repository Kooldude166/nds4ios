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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    disableSound.on = [defaults boolForKey:@"disableSound"];
    controlOpacity.value = [defaults floatForKey:@"controlOpacity"];
    shiftPad.on = [defaults boolForKey:@"shiftPad"];
    showFPS.on = [defaults boolForKey:@"showFPS"];
    
    // adjust frame skip control
    CGRect frm = frameSkip.frame;
    frm.size.height = 27;
    frm.origin.y = 8;
    int frameSkipValue = [defaults integerForKey:@"frameSkip"];
    if (frameSkipValue < 1) frameSkipValue = 5;
    frameSkip.selectedSegmentIndex = frameSkipValue - 1;
    frameSkip.frame = frm;
    for (int i=0; i < 4; i++) {
        [frameSkip setWidth:26 forSegmentAtIndex:i];
    }
    [frameSkip setWidth:56 forSegmentAtIndex:4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)controlChanged:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (sender == disableSound) {
        [defaults setBool:disableSound.on forKey:@"disableSound"];
    } else if (sender == controlOpacity) {
        [defaults setFloat:controlOpacity.value forKey:@"controlOpacity"];
    } else if (sender == shiftPad) {
        [defaults setBool:shiftPad.on forKey:@"shiftPad"];
    } else if (sender == showFPS) {
        [defaults setBool:showFPS.on forKey:@"showFPS"];
    } else if (sender == frameSkip) {
        int val = frameSkip.selectedSegmentIndex + 1;
        if (val == 5) val = -1;
        [defaults setInteger:val forKey:@"frameSkip"];
    }
}

- (IBAction)closeWindow:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidUnload {
    controlOpacity = nil;
    shiftPad = nil;
    disableSound = nil;
    showFPS = nil;
    frameSkip = nil;
    [super viewDidUnload];
}

@end
