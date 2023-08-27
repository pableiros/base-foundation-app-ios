//
//  TableViewFactory.m
//  ListObjC
//
//  Created by pablo borquez on 26/08/23.
//

#import "TableViewFactory.h"
#import "TableViewCell.h"

@implementation TableViewFactory

- (void)prepareFactory:(UITableView *)tableView {
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:@"TableViewCell"];
}

// MARK: - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"
                                                                           forIndexPath:indexPath];
  
    [[cell titleLabel]setText:[NSString stringWithFormat:@"Row: %@", @([indexPath row])]];
    
    return cell;
}

// MARK: - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end
