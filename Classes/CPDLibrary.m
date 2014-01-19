//
//  CPDAcknowledgement.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import <CPDAcknowledgements/CPDContribution.h>
#import "CPDLibrary.h"

@implementation CPDLibrary

- (id)initWithCocoaPodsMetadataPlistDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (!self) return  nil;

    _title = [dictionary[@"CPDName"] copy];
    _licenseBody = [dictionary[@"CPDLicenseText"] copy];
    _licenseType = [dictionary[@"CPDLicenseType"] copy];

    _socialMediaURL = [dictionary[@"CPDSocialMediaURL"] copy];
    _description = [dictionary[@"CPDDescription"] copy];
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

@end
