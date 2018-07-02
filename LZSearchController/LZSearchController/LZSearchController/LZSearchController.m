//
//  LZSearchController.m
//  LZSearchController
//
//  Created by Artron_LQQ on 2016/12/17.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZSearchController.h"
#import "LZResultDisplayController.h"

@interface LZSearchController ()

@property (nonatomic, strong) LZResultDisplayController *displayController;
@property (nonatomic, strong) UISearchController *searchController;
;
@end

@implementation LZSearchController
- (NSMutableArray *)datas {
    // errnull: 4.虚拟数据
    if (_datas == nil) {
        _datas = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 100; i++) {
            
            NSString *str = [NSString stringWithFormat:@"%.2d -- 测试数据", i];
            
            [_datas addObject:str];
        }
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // errnull: 2.创建用于展示搜索结果的控制器
    LZResultDisplayController *result = [[LZResultDisplayController alloc]init];
    // 将控制器1 的数据源传递给 控制器2
    result.datas = [self.datas copy];
    
    // errnull: 3.创建搜索框
    UISearchController *searchViewController = [[UISearchController alloc]initWithSearchResultsController:result];
    
    self.tableView.tableHeaderView = searchViewController.searchBar;
    
    searchViewController.searchResultsUpdater = result;
    
    self.searchController = searchViewController;

    searchViewController.searchBar.placeholder = @"搜索";
    
     [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = [self.datas objectAtIndex:indexPath.row];
    return cell;
}
@end
