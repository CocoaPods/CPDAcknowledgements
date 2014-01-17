//
//  CPDAcknowledgement.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDAcknowledgement.h"

@implementation CPDAcknowledgement

- (instancetype)initWithTitle:(NSString *)title licenseBody:(NSString *)body
{
    self = [super init];
    if (!self) return  nil;

    _title = title;
    _license = body;

    return self;
}

@end
