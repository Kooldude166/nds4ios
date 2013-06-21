//
//  SwitcherViewController.m
//  nds4ios
//
//  Created by Brian Tung on 5/15/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "AppDelegate.h"
#import "SwitcherViewController.h"
#import "SettingsViewController.h"
#import "RomsViewController.h"
#import "EmuViewController.h"
#import "FileExplorerViewController.h"

@interface SwitcherViewController ()

@end

@implementation SwitcherViewController

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
    // Do any additional setup after loading the view from its nib.
    fullWidth = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)currentGame:(id)sender
{
    [[AppDelegate sharedInstance] bringBackEmuVC];
}

- (IBAction)roms:(id)sender
{
    RomsViewController *romsVC = [[RomsViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:romsVC];
}

- (IBAction)fileBrowser:(id)sender
{
    FileExplorerViewController *filebrowserVC = [[FileExplorerViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:filebrowserVC];
}

- (IBAction)settings:(id)sender
{
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:settingsVC];
}

- (IBAction)credits:(id)sender
{
    if (fullWidth == false)
    {
        fullWidth = true;
    } else if (fullWidth == true)
    {
        fullWidth = false;
    }
}

@end
