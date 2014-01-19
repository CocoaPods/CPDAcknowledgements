//
// CPDContributionDetailViewController
// Created by orta on 18/01/2014.
//
//  Copyright (c) 2014 http://artsy.net. All rights reserved.

#import "CPDContributionDetailViewController.h"
#import "CPDContribution.h"

@interface CPDContributionDetailViewController () <UIWebViewDelegate, UIAlertViewDelegate>
@property (nonatomic, strong) CPDContribution *contribution;
@property (nonatomic, strong) NSURL *urlForAlertView;
@end

@implementation CPDContributionDetailViewController

- (id)initWithContribution:(CPDContribution *)contribution
{
    self = [super init];
    if(!self) return nil;

    _contribution = contribution;

    return self;
}

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    self.view = webView;

    webView.delegate = self;
    if([webView respondsToSelector:@selector(scrollView)])
        webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;

    NSURL *url = [NSURL URLWithString:self.contribution.URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)aWebView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSString *title = NSLocalizedString(@"Open in Safari", @"Open in Safari popover title");
        NSString *messageFormat = NSLocalizedString(@"Open '%@' in Safari", @"Open in Safari popover body format");
        NSString *message = [NSString stringWithFormat:messageFormat, request.URL.absoluteString];
        self.urlForAlertView = request.URL;

        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Open in Safari", nil];
        [alertView show];

        return NO;
    }

    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex != 0) {
        [[UIApplication sharedApplication] openURL:self.urlForAlertView];
    }
}
@end