//
//  TBaseTableViewController.h
//  iTools
//
//  Created by admin on 2017/8/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBaseViewController.h"
#import "TBaseModel.h"

#pragma mark  ===== 逻辑处理  用于处理加载更多 页面刷新
@protocol TBaseLogicDelegate <NSObject>

- (void)t_headerFreshViewLoading;

- (void)t_footerFreshViewLoading;

@end


@interface TBaseTableViewController : TBaseViewController

@property (nonatomic,assign)  id<TBaseLogicDelegate>   logicDelegate;

@property (nonatomic,strong)  TBaseModel  *dataModel;

@property (nonatomic,assign)  BOOL  t_header;

@property (nonatomic,assign)  BOOL  t_footer;

@property (nonatomic,assign)  BOOL  t_error_self;

- (TBaseModel *)configDatasource;

- (void)endRefreshing:(BOOL)noMore;

- (void)reloadResult:(BOOL)success;

@end
