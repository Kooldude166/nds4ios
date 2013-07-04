//
//  ButtonPad.h
//  DPadDemo
//
//  Created by Zydeco on 26/6/2013.
//  Copyright (c) 2013 namedfork. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum PadState {
    PadStateUp     = 0x00010000,
    PadStateDown   = 0x00020000,
    PadStateLeft   = 0x00040000,
    PadStateRight  = 0x00080000
} PadState;

@interface ButtonPad : UIControl
{
    UIControlState padState;
    UIImageView *backgroundView;
    CGSize deadZone;
}

@property CGSize deadZone; // dead zone in the middle of the control
@property UIImage *image;

@end
