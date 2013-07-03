//
//  SwitcherViewController.h
//  nds4ios
//
//  Created by Brian Tung on 5/15/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVSegmentedControl.h"

@interface SwitcherViewController : UIViewController <UIAlertViewDelegate>
{
    IBOutlet UIButton *creditsButton;
    IBOutlet UISegmentedControl *switcher;
    IBOutlet UILabel *titleLabel;
    IBOutlet UIButton *addButton;
    BOOL open;
    
    UIAlertView *settingsAlert, *addAlert;
}

@property (strong, nonatomic) SVSegmentedControl *segmentedControl;

@end
