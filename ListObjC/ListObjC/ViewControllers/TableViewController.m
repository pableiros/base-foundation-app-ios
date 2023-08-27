//
//  TableViewController.m
//  ListObjC
//
//  Created by pablo borquez on 26/08/23.
//

#import "TableViewController.h"
#import "TableViewFactory.h"

@interface TableViewController ()

@property (nonatomic, strong) TableViewFactory *factory;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareFactory];
    [self.navigationItem setTitle:@"Objective-C List"];
    [self.navigationItem setLargeTitleDisplayMode:UINavigationItemLargeTitleDisplayModeAlways];
}

- (void)prepareFactory {
    self.factory = [[TableViewFactory alloc] init];
    [self.factory prepareFactory:self.tableView];
}

@end
