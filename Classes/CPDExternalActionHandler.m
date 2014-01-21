//
// CPDExternalActionHandler
// Created by orta on 21/01/2014.
//
//  Copyright (c) 2014 http://artsy.net. All rights reserved.

#import "CPDExternalActionHandler.h"
#import "CPDLibrary.h"


@interface CPDExternalActionHandler ()
@end

@implementation CPDExternalActionHandler

+ (void)openActionForTwitterHandle:(NSString *)twitterUsername
{
	UIApplication *application = [UIApplication sharedApplication];

	BOOL hasTweetBot = [application canOpenURL:[NSURL URLWithString:@"tweetbot://"]];
	if (hasTweetBot) {
		NSString *url = [NSString stringWithFormat:@"tweetbot://%@/user_profile/%@", twitterUsername, twitterUsername];
		[application openURL:[NSURL URLWithString:url]];
		return;
	}

	BOOL hasOfficialTwitter = [application canOpenURL:[NSURL URLWithString:@"twitter://user"]];
	if (hasOfficialTwitter) {
		NSString *url = [NSString stringWithFormat:@"twitter://user?screen_name=%@", twitterUsername];
		[application openURL:[NSURL URLWithString:url]];
		return;
	}

	NSString *url = [NSString stringWithFormat:@"https://twitter.com/%@", twitterUsername];
	[application openURL:[NSURL URLWithString:url]];
}

+ (void)openEmailSheetForAuthors:(NSArray *)authors ofLibrary:(CPDLibrary *)library
{
//	MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
//	[controller setToRecipients:toRecipients];
//	[controller setSubject:subject];
//	[controller setMessageBody:body isHTML:YES];
//	controller.mailComposeDelegate = self;
//	[self presentViewController:controller animated:YES completion:^{}];
}

+ (void)openAddressInBrowser:(NSString *)address
{
	NSURL *url = [NSURL URLWithString:address];
	[[UIApplication sharedApplication] openURL:url];
}

@end