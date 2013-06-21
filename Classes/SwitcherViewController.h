//
//  SwitcherViewController.h
//  nds4ios
//
//  Created by Brian Tung on 5/15/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitcherViewController : UIViewController
{
    IBOutlet UIButton *creditsButton;
    IBOutlet UISegmentedControl *switcher;
    BOOL open;
}

@end
