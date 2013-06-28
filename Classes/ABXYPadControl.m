//
//  ABXYPadControl.m
//  nds4ios
//
//  Created by David Chavez on 6/28/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "ABXYPadControl.h"

@implementation ABXYPadControl
@synthesize deadZone;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        backgroundView.image = [UIImage imageNamed:@"ABXY"];
        [self addSubview:backgroundView];
    }
    return self;
}

- (UIControlState)state
{
    return ([super state] & ~UIControlStateApplication) | abxyPadState;
}

- (UIControlState)_stateForTouch:(UITouch*)touch
{
    // convert coords to based on center of control
    CGPoint loc = [touch locationInView:self];
    if (!CGRectContainsPoint(self.bounds, loc)) return 0;
    UIControlState state = 0;
    
    if (loc.x > (self.bounds.size.width + deadZone.width)/2) state |= ABXYPadStateA;
    else if (loc.x < (self.bounds.size.width - deadZone.width)/2) state |= ABXYPadStateY;
    if (loc.y > (self.bounds.size.height + deadZone.height)/2) state |= ABXYPadStateB;
    else if (loc.y < (self.bounds.size.height - deadZone.height)/2) state |= ABXYPadStateX;
    
    return state;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    abxyPadState = [self _stateForTouch:touch];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    abxyPadState = [self _stateForTouch:touch];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    abxyPadState = 0;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end