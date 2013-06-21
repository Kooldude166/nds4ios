//
//  AppDelegate.m
//  nds4ios
//
//  Created by rock88 on 11/12/2012.
//  Copyright (c) 2012 Homebrew. All rights reserved.
//

#import "AppDelegate.h"

#import "RomsViewController.h"
#import "SwitcherViewController.h"
#import "EmuViewController.h"
#import "MBPullDownController.h"


@implementation AppDelegate

+ (AppDelegate*)sharedInstance
{
    return [[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    SwitcherViewController *switcherViewController = [[SwitcherViewController alloc] init];
    
    RomsViewController *romsViewController = [[RomsViewController alloc] init];
    
    MBPullDownController *pullDownController = [[MBPullDownController alloc] initWithFrontController:romsViewController backController:switcherViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:pullDownController];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initRomsVCWithRom:(NSString *)rom
{
    emuVC= [[EmuViewController alloc] initWithRom:rom];
    [self.window.rootViewController presentViewController:emuVC animated:YES completion:nil];
}

- (void)bringBackEmuVC
{
    if (!emuVC || !_hasGame)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Running!" message:@"There is currently no game running! Please select a game from the ROM list to run it." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        [self.window.rootViewController presentViewController:emuVC animated:YES completion:nil];   
    }
}

- (void)killVC:(UIViewController *)controller
{
    controller = nil;
    _hasGame = NO;
}

- (BOOL *)hideControls
{
    return YES;
}

@end
