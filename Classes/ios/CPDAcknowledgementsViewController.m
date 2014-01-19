//
//  CPDAcknowledgementsViewController.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDLibrary.h"
#import "CPDTableViewDataSource.h"
#import "CPDCocoaPodsLibrariesLoader.h"
#import "CPDAcknowledgementsViewController.h"
#import "CPDLibraryDetailViewController.h"
#import "CPDContribution.h"
#import "CPDContributionDetailViewController.h"
#import "CPDStyle.h"

@interface CPDAcknowledgementsViewController () <UITableViewDelegate>
@property (nonatomic, strong) CPDTableViewDataSource *dataSource;
@property (nonatomic, strong) CPDStyle *style;

@end

@implementation CPDAcknowledgementsViewController

- (id)init
{
    id defaultStyle = [[NSObject alloc] init];
    return [self initWithStyle:defaultStyle];
}

- (id)initWithStyle:(CPDStyle *)style
{
    return [self initWithStyle:style acknowledgements:nil contributions:nil];
}

- (id)initWithStyle:(CPDStyle *)style acknowledgements:(NSArray *)acknowledgements contributions:(NSArray *)contributions
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (!self) return nil;

    if(!acknowledgements){
        NSBundle *bundle = [NSBundle mainBundle];
        acknowledgements = [CPDCocoaPodsLibrariesLoader loadAcknowledgementsWithBundle:bundle];
    }

    _dataSource = [[CPDTableViewDataSource alloc] initWithAcknowledgements:acknowledgements contributions:contributions];
    _style = style;

    self.title = @"Acknowledgements";

    return self;
}

- (void)loadView
{
    [super loadView];

    self.tableView.dataSource = self.dataSource;
}

#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    id acknowledgement = [self.dataSource acknowledgementAtIndexPath:indexPath];

    id detailController;
    if([acknowledgement isKindOfClass:CPDLibrary.class]){
        detailController = [[CPDLibraryDetailViewController alloc] initWithLibrary:acknowledgement];
        [detailController setCSS:self.style.libraryCSS];
        [detailController setHTML:self.style.libraryHTML];

    } else if([acknowledgement isKindOfClass:CPDContribution.class]){
        detailController = [[CPDContributionDetailViewController alloc] initWithContribution:acknowledgement];
    }

    [self.navigationController pushViewController:detailController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource heightForCellAtIndexPath:indexPath];
}

@end
