//
//  CPDAcknowledgement.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

@interface CPDLibrary : NSObject

- (instancetype)initWithTitle:(NSString *)title licenseBody:(NSString *)body;

@property (nonatomic, copy, readonly) NSString *title;

// TODO: Add this in CocoaPods
// @property (nonatomic, copy) NSArray *authors;

@property (nonatomic, copy, readonly) NSString *license;

@end
