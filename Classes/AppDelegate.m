//
//  AppDelegate.m
//  nds4ios
//
//  Created by rock88 on 11/12/2012.
//  Copyright (c) 2012 Homebrew. All rights reserved.
//

#import "AppDelegate.h"
#import "ROMs.h"
#import "RomsCollectionViewController.h"
#import "SwitcherViewController.h"
#import "EmuViewController.h"
#import "MBPullDownController.h"
#import "SSZipArchive.h"
#import <HockeySDK/HockeySDK.h>

#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

@implementation AppDelegate

+ (AppDelegate*)sharedInstance
{
    return [[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Set the application defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *appDefaults = [NSDictionary dictionaryWithObject:@"NO" forKey:@"experimentalUI"];
    [defaults registerDefaults:appDefaults];
    [defaults synchronize];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"experimentalUI"] && SYSTEM_VERSION_GREATER_THAN(@"5.0"))
    {
        SwitcherViewController *switcherViewController = [[SwitcherViewController alloc] init];
        
        RomsCollectionViewController *romsViewController = [[RomsCollectionViewController alloc] init];
        
        MBPullDownController *pullDownController = [[MBPullDownController alloc] initWithFrontController:romsViewController backController:switcherViewController];
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [self.window setRootViewController:pullDownController];
        [self.window makeKeyAndVisible];
    }
    else
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
            
        UIViewController *mainViewController = [storyboard instantiateInitialViewController];
            
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = mainViewController;
        [self.window makeKeyAndVisible];
    }
    
    [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"76d619e82c39c42e7a6d269437446f66" delegate:self];
    [[BITHockeyManager sharedHockeyManager] startManager];
    
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if (url != nil && [url isFileURL]) {\
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        
        NSString *importedPath = [url path];
        
        NSString *zipFilePath = importedPath;
        NSString *output = documentsDirectory;
        
        [SSZipArchive unzipFileAtPath:zipFilePath toDestination:output];
        
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:@"Inbox"] error:NULL];
        [fileManager removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:@"readme.html"] error:NULL];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [emuVC pauseEmulation];
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
    [emuVC resumeEmulation];
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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Game Running!" message:@"There is currently no game running! Please select a game from the ROM list to run it." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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

#pragma mark - UIAlertVIew delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"backToOne" object:nil];
    }
}

@end
