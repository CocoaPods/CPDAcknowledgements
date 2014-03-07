//
//  CPDContribution.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import <Foundation/Foundation.h>

@interface CPDContribution : NSObject

- (id)initWithName:(NSString *)name websiteAddress:(NSString *)address role:(NSString *)role;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *websiteAddress;
@property (nonatomic, copy, readonly) NSString *role;

@property (nonatomic, copy) NSString *avatarAddress;

@end
