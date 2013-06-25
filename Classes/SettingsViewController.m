//
//  SettingsViewController.m
//  nds4ios
//
//  Created by Brian Tung on 5/16/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

- (IBAction)SP_pressed:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)SP_pressed:(id)sender {
    
    if (shiftPad.on)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"shiftPad"];
    else
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"shiftPad"];
}
- (void)viewDidUnload {
    shiftPad = nil;
    [super viewDidUnload];
}
@end
