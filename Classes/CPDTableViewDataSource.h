//
//  CPDTableViewDataSource.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CPDAcknowledgement;
@interface CPDTableViewDataSource : NSObject <UITableViewDataSource>

- (id)initWithAcknowledgements:(NSArray *)acknowledgements;

- (CPDAcknowledgement *)acknowledgementAtIndexPath:(NSIndexPath *)indexPath;

@end
