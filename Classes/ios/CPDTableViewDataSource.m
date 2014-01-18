//
//  CPDTableViewDataSource.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDTableViewDataSource.h"
#import "CPDLibrary.h"

static const NSString *CPDTitle = @"CPDTitle";
static const NSString *CPDEntries = @"CPDEntries";

@interface CPDTableViewDataSource()
@property (nonatomic, strong) NSMutableArray *sections;
@end

@implementation CPDTableViewDataSource

- (id)initWithAcknowledgements:(NSArray *)acknowledgements contributions:(NSArray *)contributions
{
    self = [super init];
    if (!self) return nil;

    _sections = [NSMutableArray array];

    if (acknowledgements){
        [_sections addObject:@{
              CPDTitle: NSLocalizedString(@"Acknowledgements", @"Acknowledgements in detail view"),
            CPDEntries: acknowledgements,
        }];
    }
    if (contributions){
        [_sections addObject:@{
              CPDTitle: NSLocalizedString(@"Contributions", @"Contributions in detail view"),
            CPDEntries: contributions,
        }];
    }

    return self;
}

#pragma mark UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *sectionInfo = self.sections[(NSUInteger) section];
    return [sectionInfo[CPDEntries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CPDLibrary *item = [self acknowledgementAtIndexPath:indexPath];
    NSString *identifier = NSStringFromClass(item.class);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.textLabel.text = [item title];
    return cell;
}

- (CPDLibrary *)acknowledgementAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *section = self.sections[(NSUInteger) indexPath.section];
    return section[CPDEntries][(NSUInteger) indexPath.row];
}

@end
