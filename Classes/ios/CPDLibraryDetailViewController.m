//
//  CPDLibraryDetailViewController
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDLibraryDetailViewController.h"
#import "CPDLibrary.h"

@interface CPDLibraryDetailViewController () <UIWebViewDelegate, UIActionSheetDelegate>
@property (nonatomic, strong) CPDLibrary *library;
@end

@implementation CPDLibraryDetailViewController

- (id)initWithLibrary:(CPDLibrary *)library
{
    self = [super init];
    if (!self) return nil;

    _library = library;
    self.title = _library.title;

    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareTapped:)];
    self.navigationItem.rightBarButtonItem = shareButton;
}

- (void)shareTapped:(UIBarButtonItem *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    actionSheet.delegate = self;

    [self.library.actionTitlesForLibrary enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL *stop) {
        [actionSheet addButtonWithTitle:title];
    }];

    [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet setCancelButtonIndex:actionSheet.numberOfButtons - 1];
    [actionSheet showFromBarButtonItem:sender animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == actionSheet.cancelButtonIndex) return;

    [self.library performActionAtIndex:buttonIndex];
}

- (void)loadView
{
    UIWebView *webView = [self createWebview];

    NSString *html = self.HTML ? self.HTML : [self.class defaultHTMLTemplate];
    NSString *css = self.CSS ? self.CSS : [self.class defaultCSS];
    NSString *renderedHTML = [self.class generatedHTMLWithHTML:html CSS:css acknowledgement:self.library];

    [webView loadHTMLString:renderedHTML baseURL:nil];

    self.view = webView;
}

- (UIWebView *)createWebview
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.dataDetectorTypes = UIDataDetectorTypeNone;
    webView.backgroundColor = [UIColor whiteColor];
    webView.opaque = NO;

    if([webView respondsToSelector:@selector(scrollView)])
        webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;

    return webView;
}

+ (NSString *)generatedHTMLWithHTML:(NSString *)html CSS:(NSString *)css acknowledgement:(CPDLibrary *)acknowledgement
{
    NSMutableString *mutableHTML = [html mutableCopy];

    [mutableHTML replaceOccurrencesOfString:@"{{STYLESHEET}}" withString:css options:0 range:NSMakeRange(0, mutableHTML.length)];
    NSString *htmlLicense = [acknowledgement.licenseBody stringByReplacingOccurrencesOfString:@"\n\n" withString:@"</p><p>"];
    [mutableHTML replaceOccurrencesOfString:@"{{BODY}}" withString:htmlLicense options:0 range:NSMakeRange(0, mutableHTML.length)];

    return [mutableHTML copy];
}

+ (NSString *)defaultHTMLTemplate
{
    return @"<html><head>{{STYLESHEET}}</head><body><p>{{BODY}}</p></body></html>";
}

+ (NSString *)defaultCSS
{
    return @"<style> p{ font-family:HelveticaNeue; font-size: 14px; padding:12px; -webkit-user-select:none; }</style>";
}

@end
