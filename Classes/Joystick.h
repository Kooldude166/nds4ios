//
//  Joystick.h
//  nds4ios
//
//  Created by Zydeco on 4/7/2013.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "ButtonPad.h"

@interface Joystick : ButtonPad
{
    UIImageView *buttonView;
    CGRect deadZoneRect;
}
@end
