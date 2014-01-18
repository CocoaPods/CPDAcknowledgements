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

@interface CPDAcknowledgementsViewController () <UITableViewDelegate>
@property (nonatomic, strong) CPDTableViewDataSource *dataSource;
@end

@implementation CPDAcknowledgementsViewController

- (id)init
{
    id defaultStyle = [[NSObject alloc] init];
    return [self initWithStyle:defaultStyle];
}

- (id)initWithStyle:(id)style
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *defaultAcknowledgements = [CPDCocoaPodsLibrariesLoader loadAcknowledgementsWithBundle:bundle];
    return [self initWithStyle:style acknowledgements:defaultAcknowledgements contributions:nil];
}

- (id)initWithStyle:(id)style acknowledgements:(NSArray *)acknowledgements contributions:(NSArray *)contributions
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (!self) return nil;

    _dataSource = [[CPDTableViewDataSource alloc] initWithAcknowledgements:acknowledgements contributions:contributions];
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
    CPDLibrary *acknowledgement = [self.dataSource acknowledgementAtIndexPath:indexPath];
    CPDLibraryDetailViewController *detailVC = [[CPDLibraryDetailViewController alloc] initWithAcknowledgement:acknowledgement];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
