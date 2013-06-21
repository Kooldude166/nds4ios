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
#import "MBPullDownController.h"

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
    open = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switcher:(id)sender
{
    if (switcher.selectedSegmentIndex == 0)
    {
        [[AppDelegate sharedInstance] bringBackEmuVC];
        switcher.selectedSegmentIndex = 1;
    } else if (switcher.selectedSegmentIndex == 1) {
        RomsViewController *romsVC = [[RomsViewController alloc] init];
        [self.pullDownController setFrontController:romsVC];
    } else if (switcher.selectedSegmentIndex == 2) {
        FileExplorerViewController *explorer = [[FileExplorerViewController alloc] init];
        [self presentViewController:explorer animated:YES completion:^{
            switcher.selectedSegmentIndex = 1;
        }];
    } else if (switcher.selectedSegmentIndex == 3) {
        SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
        [self presentViewController:settingsVC animated:YES completion:^{
            switcher.selectedSegmentIndex = 1;
        }];
    }
}

- (IBAction)credits:(id)sender
{
    if (open == false)
    {
        [self.pullDownController setOpenBottomOffset:44.f animated:YES];
        open = true;
    } else if (open == true)
    {
        [self.pullDownController setOpenBottomOffset:440.f animated:YES];
        open = false;
    }
}

@end
