//
//  CPDAcknowledgement.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import <CPDAcknowledgements/CPDContribution.h>
#import "CPDLibrary.h"
#import "CPDExternalActionHandler.h"


@implementation CPDLibrary

- (id)initWithCocoaPodsMetadataPlistDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (!self) return  nil;

    _title = [dictionary[@"CPDName"] copy];
    _licenseBody = [dictionary[@"CPDLicenseText"] copy];
    _licenseType = [dictionary[@"CPDLicenseType"] copy];

    _socialMediaAddress = [dictionary[@"CPDSocialMediaURL"] copy];
    _libraryDescription = [dictionary[@"CPDDescription"] copy];
    _version = [dictionary[@"CPDVersion"] copy];

    _authors = [self authorsWithObject:dictionary[@"CPDAuthors"]];

    return self;
}

- (NSArray *)authorsWithObject:(id)object
{
    if ([object isKindOfClass:NSDictionary.class]){
        NSMutableArray *authors = [NSMutableArray array];

        [object enumerateKeysAndObjectsUsingBlock:^(NSString *name, NSString* email, BOOL *stop) {
            NSString *mailToLink = [NSString stringWithFormat:@"mailto:%@", email];
            CPDContribution *contribution = [[CPDContribution alloc] initWithName:name url:mailToLink role:nil];
            [authors addObject:contribution];
        }];

        return authors;
    }

    if ([object isKindOfClass:NSString.class]){
        return @[ [[CPDContribution alloc] initWithName:object url:nil role:nil] ];
    }

    return nil;
}

- (NSString *)twitterHandle
{
    if ([self.socialMediaAddress hasPrefix:@"https://twitter"]){
        return [[self.socialMediaAddress componentsSeparatedByString:@"/"] lastObject];
    }
    return nil;
}

- (NSDictionary *)actionsWithSelectors
{
    return @{
        NSLocalizedString(@"Email Author", @"Email Authors alert text"): NSStringFromSelector(@selector(emailAuthors)),
        NSLocalizedString(@"Email Authors", @"Email Authors alert text"): NSStringFromSelector(@selector(emailAuthors)),
        NSLocalizedString(@"Open Website", @"Open Website alert text"): NSStringFromSelector(@selector(openLibraryWebsite)),
        [NSString stringWithFormat:@"@%@", self.twitterHandle]: NSStringFromSelector(@selector(openTwitterPage)),
    };
}

- (NSArray *)actionTitlesForLibrary
{
    NSMutableArray *actionTitles = [NSMutableArray array];
    if (self.authors.count > 0){
        if (self.authors.count == 1){
            [actionTitles addObject:NSLocalizedString(@"Email Author", @"Email Authors alert text")];
        }  else {
            [actionTitles addObject:NSLocalizedString(@"Email Authors", @"Email Single Author alert text")];
        }
    }

    if (self.websiteAddress.length > 0){
        [actionTitles addObject:NSLocalizedString(@"Open Website", @"Open Website alert text")];
    }

    if ([self.socialMediaAddress hasPrefix:@"https://twitter"]){
        [actionTitles addObject:[@"@" stringByAppendingString:self.twitterHandle]];
    }

    return actionTitles;
}

- (void)performActionAtIndex:(NSInteger)index
{
    NSString *title = self.actionTitlesForLibrary[index];
    NSString *selectorString = self.actionsWithSelectors[title];
    SEL action = NSSelectorFromString(selectorString);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:action];
#pragma clang diagnostic pop
}
- (void)emailAuthors
{
	// Generate emails
	//[CPDExternalActionHandler openEmailSheetForAuthors:<#(NSArray *)authors#> ofLibrary:<#(CPDLibrary *)library#>];
}

- (void)openTwitterPage
{
    [CPDExternalActionHandler openActionForTwitterHandle:self.twitterHandle];
}

- (void)openLibraryWebsite
{

}

@end
