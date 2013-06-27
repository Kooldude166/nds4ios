//
//  DPadControl.m
//  DPadDemo
//
//  Created by Zydeco on 26/6/2013.
//  Copyright (c) 2013 namedfork. All rights reserved.
//

#import "DPadControl.h"

@implementation DPadControl
@synthesize deadZone;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (UIControlState)state
{
    return ([super state] & ~UIControlStateApplication) | dPadState;
}

- (UIControlState)_stateForTouch:(UITouch*)touch
{
    // convert coords to based on center of control
    CGPoint loc = [touch locationInView:self];
    if (!CGRectContainsPoint(self.bounds, loc)) return 0;
    UIControlState state = 0;
    
    if (loc.x > (self.bounds.size.width + deadZone.width)/2) state |= DPadStateRight;
    else if (loc.x < (self.bounds.size.width - deadZone.width)/2) state |= DPadStateLeft;
    if (loc.y > (self.bounds.size.height + deadZone.height)/2) state |= DPadStateDown;
    else if (loc.y < (self.bounds.size.height - deadZone.height)/2) state |= DPadStateUp;
    
    return state;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    dPadState = [self _stateForTouch:touch];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    dPadState = [self _stateForTouch:touch];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    dPadState = 0;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
