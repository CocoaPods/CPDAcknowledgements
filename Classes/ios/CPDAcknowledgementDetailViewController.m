//
//  CPDAcknowledgementDetailViewController
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDAcknowledgementDetailViewController.h"
#import "CPDAcknowledgement.h"

@interface CPDAcknowledgementDetailViewController ()
@property (nonatomic, strong) CPDAcknowledgement *acknowledgement;
@end

@implementation CPDAcknowledgementDetailViewController

- (id)initWithAcknowledgement:(CPDAcknowledgement *)acknowledgement
{
    self = [super init];
    if (!self) return nil;

    _acknowledgement = acknowledgement;

    return self;
}

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];

    NSString *html = self.html ? self.html : [self.class defaultHTMLTemplate];
    NSString *css = self.css ? self.css : [self.class defaultCSS];
    NSString *renderedHTML = [self.class generatedHTMLWithHTML:html CSS:css acknowledgement:self.acknowledgement];

    [webView loadHTMLString:renderedHTML baseURL:nil];

    self.view = webView;
}

+ (NSString *)generatedHTMLWithHTML:(NSString *)html CSS:(NSString *)css acknowledgement:(CPDAcknowledgement *)acknowledgement
{
    NSMutableString *mutableHTML = [html mutableCopy];

    [mutableHTML replaceOccurrencesOfString:@"{{STYLESHEET}}" withString:css options:0 range:NSMakeRange(0, mutableHTML.length)];
    [mutableHTML replaceOccurrencesOfString:@"{{TITLE}}" withString:acknowledgement.title options:0 range:NSMakeRange(0, mutableHTML.length)];
    [mutableHTML replaceOccurrencesOfString:@"{{BODY}}" withString:acknowledgement.license options:0 range:NSMakeRange(0, mutableHTML.length)];

    return [mutableHTML copy];
}

+ (NSString *)defaultHTMLTemplate
{
    return @"<html><head>{{STYLESHEET}}</head><body><h1>{{TITLE}}</h1><p>{{BODY}}</p></body></html>";
}

+ (NSString *)defaultCSS
{
    return @"<style>h2{ font-weight:bold; }</style>";
}


@end
