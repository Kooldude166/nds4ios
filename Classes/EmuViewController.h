//
//  ViewController.h
//  nds4ios
//
//  Created by rock88 on 11/12/2012.
//  Copyright (c) 2012 Homebrew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonPad.h"

@interface EmuViewController : UIViewController <UIActionSheetDelegate>
{
    // Controls
    ButtonPad *buttonDPad, *buttonABXYPad;
    UIButton* buttonSelect;
    UIButton* buttonStart;
    UIButton* buttonExit;
    UIButton *buttonLT;
    UIButton *buttonRT;
    
    UIImageView *snapshotView;
    
    NSLock *emuLoopLock;
}

- (id)initWithRom:(NSString*)rom;
- (void)pauseEmulation;
- (void)resumeEmulation;

@end
