//
//  CPDAppDelegate.m
//  CPDAcknowledgements
//
//  Created by Orta on 17/01/2014.
//  Copyright (c) 2014 CocoaPods. All rights reserved.
//

#import "CPDAppDelegate.h"
#import <CPDAcknowledgements/CPDAcknowledgementsViewController.h>

@implementation CPDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    CPDAcknowledgementsViewController *acknowledgementsViewController = [[CPDAcknowledgementsViewController alloc] init];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:acknowledgementsViewController];

    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
