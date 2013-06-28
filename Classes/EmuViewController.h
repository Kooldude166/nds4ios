//
//  ViewController.h
//  nds4ios
//
//  Created by rock88 on 11/12/2012.
//  Copyright (c) 2012 Homebrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPadControl.h"

@interface EmuViewController : UIViewController <UIActionSheetDelegate>
{
    // Controls
    DPadControl *buttonDPad;
    UIButton* buttonY;
    UIButton* buttonX;
    UIButton* buttonB;
    UIButton* buttonA;
    UIButton* buttonSelect;
    UIButton* buttonStart;
    UIButton* buttonExit;
    UIButton *buttonLT;
    UIButton *buttonRT;
}

- (id)initWithRom:(NSString*)rom;

@end
