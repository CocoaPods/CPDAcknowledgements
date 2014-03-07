//
//  CPDAppDelegate.m
//  CPDAcknowledgements
//
//  Created by Orta on 17/01/2014.
//  Copyright (c) 2014 CocoaPods. All rights reserved.
//

#import "CPDAppDelegate.h"
#import "CPDContribution.h"
#import <CPDAcknowledgements/CPDAcknowledgementsViewController.h>

@implementation CPDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    CPDContribution *orta = [[CPDContribution alloc] initWithName:@"Orta" websiteAddress:@"http://orta.github.io" role:@"Behind a wheel"];
    orta.avatarAddress = @"https://1.gravatar.com/avatar/f116cb3be23153ec08b94e8bd4dbcfeb?d=https%3A%2F%2Fidenticons.github.com%2F243e8373034964abf7c8a8e57d4df724.png&r=x&s=86";

    CPDContribution *fabio = [[CPDContribution alloc] initWithName:@"Fabio Pelosin" websiteAddress:@"http://twitter.com/fabiopelosin" role:@"Back Seat Driver"];
    fabio.avatarAddress = @"https://0.gravatar.com/avatar/b6dde1a78e6215a592768c1e78a54adc?d=https%3A%2F%2Fidenticons.github.com%2Fbdc4e72be51d566c2fc9564ed8182611.png&r=x&s=86";

    CPDContribution *kyle = [[CPDContribution alloc] initWithName:@"Kyle Fuller" websiteAddress:@"http://twitter.com/kylefuller" role:@"Somewhere in the boot"];
    NSArray *contributors = @[orta, fabio, kyle];

    CPDAcknowledgementsViewController *acknowledgementsViewController = [[CPDAcknowledgementsViewController alloc] initWithStyle:nil acknowledgements:nil contributions:contributors];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:acknowledgementsViewController];

    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
