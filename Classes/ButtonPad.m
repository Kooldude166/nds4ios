//
//  ButtonPad.m
//  DPadDemo
//
//  Created by Zydeco on 26/6/2013.
//  Copyright (c) 2013 namedfork. All rights reserved.
//

#import "ButtonPad.h"

@implementation ButtonPad
@synthesize deadZone;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        backgroundView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:backgroundView];
        
        self.deadZone = CGSizeMake(frame.size.width/3, frame.size.height/3);
    }
    return self;
}

- (UIControlState)state
{
    return ([super state] & ~UIControlStateApplication) | padState;
}

- (UIControlState)_stateForTouch:(UITouch*)touch
{
    // convert coords to based on center of control
    CGPoint loc = [touch locationInView:self];
    if (!CGRectContainsPoint(self.bounds, loc)) return 0;
    UIControlState state = 0;
    
    if (loc.x > (self.bounds.size.width + deadZone.width)/2) state |= PadStateRight;
    else if (loc.x < (self.bounds.size.width - deadZone.width)/2) state |= PadStateLeft;
    if (loc.y > (self.bounds.size.height + deadZone.height)/2) state |= PadStateDown;
    else if (loc.y < (self.bounds.size.height - deadZone.height)/2) state |= PadStateUp;
    
    return state;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    padState = [self _stateForTouch:touch];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    padState = [self _stateForTouch:touch];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    padState = 0;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setImage:(UIImage*)newImage {
    backgroundView.image = newImage;
}

- (UIImage*)image {
    return backgroundView.image;
}
@end
