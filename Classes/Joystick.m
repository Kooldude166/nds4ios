//
//  Joystick.m
//  nds4ios
//
//  Created by Zydeco on 4/7/2013.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "Joystick.h"

@implementation Joystick

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"JoystickBackground"];
        buttonView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 56, 56)];
        buttonView.image = [UIImage imageNamed:@"JoystickButton"];
        buttonView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:buttonView];
    }
    return self;
}

- (UIControlState)_stateForTouch:(UITouch*)touch
{
    // convert coords to based on center of control
    CGPoint loc = [touch locationInView:self];
    UIControlState state = 0;
    
    if (loc.x > (self.bounds.size.width + deadZone.width)/2) state |= PadStateRight;
    else if (loc.x < (self.bounds.size.width - deadZone.width)/2) state |= PadStateLeft;
    if (loc.y > (self.bounds.size.height + deadZone.height)/2) state |= PadStateDown;
    else if (loc.y < (self.bounds.size.height - deadZone.height)/2) state |= PadStateUp;
    
    return state;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint loc = [touch locationInView:self];
    deadZoneRect = CGRectMake((self.bounds.size.width - self.deadZone.width)/2, (self.bounds.size.height - self.deadZone.height)/2, self.deadZone.width, self.deadZone.height);
    if (!CGRectContainsPoint(deadZoneRect, loc)) return NO;
    buttonView.center = loc;
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (![super continueTrackingWithTouch:touch withEvent:event]) return NO;
    
    // keep button inside
    CGPoint loc = [touch locationInView:self];
    loc.x -= self.bounds.size.width/2;
    loc.y -= self.bounds.size.height/2;
    double radius = sqrt(loc.x*loc.x+loc.y*loc.y);
    double maxRadius = self.bounds.size.width * 0.45;
    if (radius > maxRadius) {
        double angle = atan(loc.y/loc.x);
        if (loc.x < 0) angle += M_PI;
        radius = maxRadius;
        loc.x = radius * cos(angle);
        loc.y = radius * sin(angle);
    }
    loc.x += self.bounds.size.width/2;
    loc.y += self.bounds.size.height/2;
    buttonView.center = loc;
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super endTrackingWithTouch:touch withEvent:event];
    buttonView.center = backgroundView.center;
}

@end
