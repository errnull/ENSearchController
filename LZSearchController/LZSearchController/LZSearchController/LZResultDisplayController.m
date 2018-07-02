//
//  LZResultDisplayController.m
//  LZSearchController
//
//  Created by Artron_LQQ on 2016/12/17.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "LZResultDisplayController.h"

@interface LZResultDisplayController ()

@property (nonatomic, strong) NSMutableArray *results;
@end

@implementation LZResultDisplayController

- (NSMutableArray *)results {
    if (_results == nil) {
        _results = [NSMutableArray arrayWithCapacity:0];
    }
    return _results;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor greenColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"resultCell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"resultCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.results objectAtIndex:indexPath.row];
    return cell;
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    // errnull: 在这里拿到用户在 SearchBar 输入的字符，然后进行数据筛选，刷新数据源
    NSString *inputStr = searchController.searchBar.text;
    
    if (self.results.count > 0) {
        [self.results removeAllObjects];
    }
    for (NSString *str in self.datas) {
        
        if ([str.lowercaseString rangeOfString:inputStr.lowercaseString].location != NSNotFound) {
            
            [self.results addObject:str];
        }
    }
    
    // errnull: 6.刷新页面，显示搜索结果
    [self.tableView reloadData];
}
@end
