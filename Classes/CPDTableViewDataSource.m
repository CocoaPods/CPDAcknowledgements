//
//  CPDTableViewDataSource.m
//  Pods
//
//  Created by Orta on 17/01/2014.
//
//

#import "CPDTableViewDataSource.h"
#import "CPDAcknowledgement.h"

@interface CPDTableViewDataSource()
@property (nonatomic, copy) NSArray *acknowledgements;
@end

@implementation CPDTableViewDataSource 

- (id)initWithAcknowledgements:(NSArray *)acknowledgements
{
    self = [super init];
    if (!self) return nil;

    _acknowledgements = [acknowledgements copy];

    return self;
}

#pragma mark

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.acknowledgements.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CPDAcknowledgement *item = [self acknowledgementAtIndexPath:indexPath];
    NSString *identifier = NSStringFromClass(item.class);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.textLabel.text = [item title];
    return cell;
}

- (CPDAcknowledgement *)acknowledgementAtIndexPath:(NSIndexPath *)indexPath {
    CPDAcknowledgement *item = self.acknowledgements[indexPath.row];
    return item;
}

@end
