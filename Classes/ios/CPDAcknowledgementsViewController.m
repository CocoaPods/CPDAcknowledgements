//
//  CPDAcknowledgementsViewController.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDAcknowledgementsViewController.h"
#import "CPDAcknowledgementsLoader.h"
#import "CPDTableViewDataSource.h"
#import "CPDAcknowledgement.h"

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
    self = [super init];
    if (!self) return nil;

    _dataSource = [[CPDTableViewDataSource alloc] initWithAcknowledgements:acknowledgements];

    return self;
}

- (void)loadView
{
    UITableView *tableView = [[UITableView alloc] init];
    self.view = tableView;

    tableView.delegate = self;
    tableView.dataSource = self.dataSource;
}

#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    CPDAcknowledgement *acknowledgement = [self.dataSource acknowledgementAtIndexPath:indexPath];
    NSLog(@"%@", acknowledgement);
}

@end
