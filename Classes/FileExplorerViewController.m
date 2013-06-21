//
//  FileExplorerViewController.m
//  nds4ios
//
//  Created by W.MS on 6/12/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "FileExplorerViewController.h"

@interface FileExplorerViewController ()

@end

@implementation FileExplorerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // BLANK
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
