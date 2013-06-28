//
//  ABXYPadControl.h
//  nds4ios
//
//  Created by David Chavez on 6/28/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum ABXYPadState {
    ABXYPadStateX     = 0x00010000,
    ABXYPadStateB   = 0x00020000,
    ABXYPadStateY   = 0x00040000,
    ABXYPadStateA  = 0x00080000
} ABXYPadState;

@interface ABXYPadControl : UIControl
{
    UIControlState abxyPadState;
    UIImageView *backgroundView;
}

@property CGSize deadZone; // dead zone in the middle of the control

@end
