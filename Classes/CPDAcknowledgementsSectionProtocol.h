//
//  CPDAcknowledgementsSectionProtocol.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import <Foundation/Foundation.h>

@protocol CPDAcknowledgementsSectionProtocol <NSObject>

@required
- (NSString *)titleForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSUInteger)numberOfItemsIn;

@optional

- (NSString *)subTitleForItemAtIndexPath:(NSIndexPath *)indexPath;

/// If URL is available and -[UIApplication canOpenURL:] uses UITableViewCellAccessoryDisclosureIndicator
- (NSURL *)URLForItemAtIndexPath:(NSIndexPath *)indexPath;

/// Title for the section
- (NSString *)title;

@end


@interface TheTableViewDataSource

/// array of objects conforming to the CPDSectionProtocol
@property (nonatomic, strong) NSArray *sections;

@end
