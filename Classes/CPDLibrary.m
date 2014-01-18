//
//  CPDAcknowledgement.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDLibrary.h"

@implementation CPDLibrary

- (instancetype)initWithTitle:(NSString *)title licenseBody:(NSString *)body
{
    self = [super init];
    if (!self) return  nil;

    _title = title;
    _license = body;

    return self;
}

@end
