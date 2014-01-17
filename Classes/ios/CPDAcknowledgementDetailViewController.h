//
//  CPDAcknolegementDetailViewControllerViewController.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import <UIKit/UIKit.h>

@class CPDAcknowledgement;
@interface CPDAcknowledgementDetailViewController : UIViewController

- (id)initWithAcknowledgement:(CPDAcknowledgement *)acknowledgement;

@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *css;

@end
