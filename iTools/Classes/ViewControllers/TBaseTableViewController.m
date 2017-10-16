//
//  TBaseTableViewController.m
//  iTools
//
//  Created by admin on 2017/8/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TBaseTableViewController.h"
#import <MJRefresh/MJRefresh.h>

static  NSString  *cellID  = @"TCellID";

@interface TBaseTableViewController ()<UITableViewDelegate,UITableViewDataSource,TErrorPageRefreshDelegate>
{
    UITableView      *tableView;
}
@end

@implementation TBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.error_delegate = self;
    [self loadTableView];
    [self loadDatasource];
}

- (void)loadTableView{
    tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
- (void)loadDatasource {
    _dataModel = [self configDatasource];
    [self requestData];
}


- (void)setT_header:(BOOL)t_header{
    if (t_header) {
        tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self requestData];
            if ([self.logicDelegate respondsToSelector:@selector(t_headerFreshViewLoading)]) {
                [self.logicDelegate t_headerFreshViewLoading];
            }
        }];
    }
}

- (void)setT_footer:(BOOL)t_footer{
    if (t_footer) {
        tableView.mj_footer  = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self requestData];
            if ([self.logicDelegate respondsToSelector:@selector(t_footerFreshViewLoading)]) {
                [self.logicDelegate t_footerFreshViewLoading];
            }
        }];
    }
}

- (void)setT_error_self:(BOOL)t_error_self{
    self.t_error = t_error_self;
    tableView.alpha = !t_error_self;
}

- (void)endRefreshing:(BOOL)noMore{
    [tableView reloadData];
    [tableView.mj_header endRefreshing];
    [tableView.mj_footer endRefreshing];
    if (noMore) [tableView.mj_footer endRefreshingWithNoMoreData];
}

- (void)requestData {
    [_dataModel loadData:^{
        
    } finishBlock:^(TBaseModel *model) {
        [self reloadResult:YES];
    } errorBlock:^(NSError *error) {
        //失败 弹出提示框
    }];
}

- (void)reloadResult:(BOOL)success {
    if (_dataModel.data) {
        [self endRefreshing:_dataModel.canLoadMore];
    }else{
        self.t_error_self = YES;
    }
}

- (TBaseModel *)configDatasource {
    TBaseModel *model = [[TBaseModel alloc] init];
    return model;
}

#pragma mark  =====

- (void)t_errorPageRefreshClick{
    [tableView.mj_header beginRefreshing];
}

#pragma mark  =====  UITableView Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark  =====  UITableView Datasource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

@end
