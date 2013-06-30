//
//  SwitcherViewController.m
//  nds4ios
//
//  Created by Brian Tung on 5/15/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "AppDelegate.h"
#import "SwitcherViewController.h"
//#import "SettingsViewController.h"
#import "RomsViewController.h"
#import "EmuViewController.h"
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

- (void)viewDidAppear:(BOOL)animated
{
    titleLabel.font = [UIFont systemFontOfSize:23];
    addButton.titleLabel.font = [UIFont systemFontOfSize:25];
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
        //SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
        //[self presentViewController:settingsVC animated:YES completion:^{
            //switcher.selectedSegmentIndex = 1;
        //}];
    }
}

- (IBAction)add:(id)sender
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"showedROMAlert"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com/search?hl=en&source=hp&q=download+ROMs+nds+nintendo+ds&aq=f&oq=&aqi="]];
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Hey You! Yes, You!", @"")
                                                        message:NSLocalizedString(@"This opens Safari. Simply download the ROM you want, and then 'Open In...' nds4ios. Everything else will be taken care of. You should own the actual cartridge of any ROM you download!", @"")
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"Ok", @"")
                                              otherButtonTitles:nil];
        [alert show];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"showedROMAlert"];
    }
}

#pragma mark - UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com/search?hl=en&source=hp&q=download+ROMs+nds+nintendo+ds&aq=f&oq=&aqi="]];
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
        [self.pullDownController setOpenBottomOffset:352.f animated:YES];
        open = false;
    }
}
@end
