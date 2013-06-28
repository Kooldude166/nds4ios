//
//  ViewController.h
//  nds4ios
//
//  Created by rock88 on 11/12/2012.
//  Copyright (c) 2012 Homebrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPadControl.h"
#import "ABXYPadControl.h"

@interface EmuViewController : UIViewController <UIActionSheetDelegate>
{
    // Controls
    DPadControl *buttonDPad;
    ABXYPadControl *buttonABXYPad;
    UIButton* buttonSelect;
    UIButton* buttonStart;
    UIButton* buttonExit;
    UIButton *buttonLT;
    UIButton *buttonRT;
}

- (id)initWithRom:(NSString*)rom;

@end
