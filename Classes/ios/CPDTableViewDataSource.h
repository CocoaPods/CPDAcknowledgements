//
//  CPDTableViewDataSource.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CPDLibrary;
@interface CPDTableViewDataSource : NSObject <UITableViewDataSource>

- (id)initWithAcknowledgements:(NSArray *)acknowledgements contributions:(NSArray *)contributions;

- (CPDLibrary *)acknowledgementAtIndexPath:(NSIndexPath *)indexPath;

@end
