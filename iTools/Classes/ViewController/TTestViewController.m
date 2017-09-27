//
//  TTestViewController.m
//  iTools
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTestViewController.h"
#import "TTestTableViewCell.h"

static  NSString  *kDatasourceNotificationNamed = @"_datasources";


@interface TTestViewController ()<TBaseTableViewDelegate,TBaseLogicDelegate,TBaseTableViewDatasource,TErrorPageRefreshDelegate>

@property (nonatomic,copy) NSMutableArray *datasources;

@end

@implementation TTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configTableViewData];
    self.t_footer = YES;
    self.t_header = YES;
    self.delegate = self;
    self.datasource = self;
    self.logicDelegate = self;
    self.error_delegate = self;
    self.t_error_self = YES;
    [self addObserver:self forKeyPath:kDatasourceNotificationNamed options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
}

- (void)dealloc{
    if ([self isViewLoaded]) {
        [self removeObserver:self forKeyPath:kDatasourceNotificationNamed];
    }
}

- (void)configTableViewData{
    _datasources = [[NSMutableArray alloc] initWithCapacity:0];
}

#pragma mark  ===   代理方法
- (CGFloat)t_heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)t_didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)t_numberOfRowsInSection:(NSInteger)section{
    return _datasources.count;
}

- (TBaseTableViewCell *)t_cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TTestTableViewCell *cell = [[TTestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    [cell reloadBaseTableViewCell:_datasources[indexPath.row]];
    return cell;
}

- (void)t_headerFreshViewLoading{
    [[self mutableArrayValueForKeyPath:kDatasourceNotificationNamed] removeAllObjects];
    [self endRefreshing:NO];
}

- (void)t_footerFreshViewLoading{
    [self endRefreshing:YES];
}

- (void)t_errorPageRefreshClick{
    [self endRefreshing:NO];
}

#pragma mark  =====

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:kDatasourceNotificationNamed]) {
        self.t_error_self = _datasources.count==0;
    }
}
@end
