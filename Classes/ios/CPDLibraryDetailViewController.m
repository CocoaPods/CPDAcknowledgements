//
//  CPDLibraryDetailViewController
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDLibraryDetailViewController.h"
#import "CPDLibrary.h"

@interface CPDLibraryDetailViewController () <UIWebViewDelegate>
@property (nonatomic, strong) CPDLibrary *acknowledgement;
@end

@implementation CPDLibraryDetailViewController

- (id)initWithLibrary:(CPDLibrary *)library
{
    self = [super init];
    if (!self) return nil;

    _acknowledgement = library;
    self.title = _acknowledgement.title;

    return self;
}

- (void)loadView
{
    UIWebView *webView = [self createWebview];

    NSString *html = self.HTML ? self.HTML : [self.class defaultHTMLTemplate];
    NSString *css = self.CSS ? self.CSS : [self.class defaultCSS];
    NSString *renderedHTML = [self.class generatedHTMLWithHTML:html CSS:css acknowledgement:self.acknowledgement];

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
    NSString *htmlLicense = [acknowledgement.license stringByReplacingOccurrencesOfString:@"\n\n" withString:@"</p><p>"];
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
