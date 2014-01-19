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

- (id)initWithLibrary:(CPDLibrary *)library;

@property (nonatomic, copy) NSString *HTML;
@property (nonatomic, copy) NSString *CSS;

@end
