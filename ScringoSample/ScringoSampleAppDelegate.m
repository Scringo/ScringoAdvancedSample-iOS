//
//  ScringoSampleAppDelegate.m
//  ScringoSample
//
//  Created by Guy Federovsky on 03/03/13.
//  Copyright (c) 2013 Scringo. All rights reserved.
//

#import "ScringoSampleAppDelegate.h"
#import "ScringoSampleViewController.h"

#import <Scringo/Scringo.h>
#import <Scringo/ScringoAds.h>
#import <Scringo/ScringoUser.h>

@implementation ScringoSampleAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

    // Override point for customization after application launch.
    [Scringo setScringoActivationButtonType:SCRINGO_BUTTON2];

    self.viewController = [[[ScringoSampleViewController alloc] initWithNibName:@"ScringoSampleViewController" bundle:nil] autorelease];
    UINavigationController *hostNav = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    [hostNav setNavigationBarHidden:YES];
    [self.window setRootViewController:hostNav];
    [self.window makeKeyAndVisible];

    BOOL withSidebar = YES;
    [Scringo initWithAppId:@"YOUR_SCRINGO_APP_ID" completion:^{
        NSLog(@"Scringo is DONE updating from its servers. Current user Id: %@", [ScringoUser currentUser].userId);
        if (withSidebar) {
            // if you want a sidebar, call this
            [Scringo addSidebar:self.window toLeft:YES];
        }
    }];

    if (! withSidebar) {
        // Preload the data you want (optional)
        [Scringo preloadInboxWithCompletion:^{
            NSLog(@"Done loading Inbox ...");
        }];
    }

    [ScringoAds showPopInAdNow];
    [Scringo setTestMode:YES];

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
    [ScringoAds showPopInAdNow];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [Scringo handleOpenURL:url];
}

@end
