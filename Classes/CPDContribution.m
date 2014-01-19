//
//  CPDContribution.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDContribution.h"

@implementation CPDContribution

- (id)initWithName:(NSString *)name url:(NSString *)url role:(NSString *)role
{
    self = [super init];
    if(!self) return self;

    _name = name;
    _URL = url;
    _role = role;

    return self;
}

@end
