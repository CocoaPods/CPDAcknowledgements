//
//  CPDAcknowledgementsViewController.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDAcknowledgement.h"
#import "CPDTableViewDataSource.h"
#import "CPDAcknowledgementsLoader.h"
#import "CPDAcknowledgementsViewController.h"
#import "CPDAcknowledgementDetailViewController.h"

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
    NSArray *defaultAcknowledgements = [CPDAcknowledgementsLoader loadAcknowledgementsWithBundle:bundle];
    return [self initWithStyle:style acknowledgements:defaultAcknowledgements];
}

- (id)initWithStyle:(id)style acknowledgements:(NSArray *)acknowledgements;
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (!self) return nil;

    _dataSource = [[CPDTableViewDataSource alloc] initWithAcknowledgements:acknowledgements];

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
    CPDAcknowledgement *acknowledgement = [self.dataSource acknowledgementAtIndexPath:indexPath];
    CPDAcknowledgementDetailViewController *detailVC = [[CPDAcknowledgementDetailViewController alloc] initWithAcknowledgement:acknowledgement];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
