//
//  DPadControl.h
//  DPadDemo
//
//  Created by Zydeco on 26/6/2013.
//  Copyright (c) 2013 namedfork. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum DPadState {
    DPadStateUp     = 0x00010000,
    DPadStateDown   = 0x00020000,
    DPadStateLeft   = 0x00040000,
    DPadStateRight  = 0x00080000
} DPadState;

@interface DPadControl : UIControl
{
    UIControlState dPadState;
    UIImageView *backgroundView;
}

@property CGSize deadZone; // dead zone in the middle of the control

@end
