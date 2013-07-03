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
#import "RomsCollectionViewController.h"
#import "EmuViewController.h"
#import "MBPullDownController.h"
#import "SVSegmentedControl.h"

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
    _segmentedControl = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"Resume", @"ROMs", @"Settings", nil]];
    _segmentedControl.changeHandler = ^(NSUInteger newIndex) {
        if (newIndex == 0)
        {
            [[AppDelegate sharedInstance] bringBackEmuVC];
        } else if (newIndex == 1)
        {
            RomsCollectionViewController *romsVC = [[RomsCollectionViewController alloc] init];
            [self.pullDownController setFrontController:romsVC];
        } else if (newIndex == 2)
        {
            //SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
            //[self.pullDownController setFrontController:settingsVC];
            settingsAlert = [[UIAlertView alloc] initWithTitle:@"You There!" message:@"Settings hasn't been enabled here yet! Switch back to default UI to change them." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [settingsAlert show];
        }
    };
    
    [_segmentedControl setSelectedSegmentIndex:1 animated:YES];
    _segmentedControl.center = CGPointMake(self.view.frame.size.width / 2, 85);
    [self.view addSubview:_segmentedControl];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setBackToOne) name:@"backToOne" object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    titleLabel.font = [UIFont systemFontOfSize:23];
    addButton.titleLabel.font = [UIFont systemFontOfSize:25];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)setBackToOne
{
    [_segmentedControl setSelectedSegmentIndex:1 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"showedROMAlert"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com/search?hl=en&source=hp&q=download+ROMs+nds+nintendo+ds&aq=f&oq=&aqi="]];
    }
    else {
        addAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Hey You! Yes, You!", @"")
                                                        message:NSLocalizedString(@"This opens Safari. Simply download the ROM you want, and then 'Open In...' nds4ios. Everything else will be taken care of. You should own the actual cartridge of any ROM you download!", @"")
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"Ok", @"")
                                              otherButtonTitles:nil];
        [addAlert show];
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"showedROMAlert"];
    }
}

#pragma mark - UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView == settingsAlert)
    {
        if (buttonIndex == 0) {
            [self setBackToOne];
        }
    } else if (alertView == addAlert)
    {
        if (buttonIndex == 0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com/search?hl=en&source=hp&q=download+ROMs+nds+nintendo+ds&aq=f&oq=&aqi="]];
        }
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
