//
//  TableViewFactory.h
//  ListObjC
//
//  Created by pablo borquez on 26/08/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewFactory : NSObject<UITableViewDataSource, UITableViewDelegate>

- (void)prepareFactory:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
