//
//  CPDLibraryDetailViewController.h
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import <UIKit/UIKit.h>

@class CPDLibrary;
@interface CPDLibraryDetailViewController : UIViewController

- (id)initWithAcknowledgement:(CPDLibrary *)acknowledgement;

@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *css;

@end
