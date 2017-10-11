//
//  TBaseTableViewController.h
//  iTools
//
//  Created by admin on 2017/8/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBaseViewController.h"

@class TBaseTableViewCell;

#pragma mark  =====  TableView Delegate
@protocol TBaseTableViewDatasource <NSObject>

@optional

@required

- (NSInteger)t_numberOfRowsInSection:(NSInteger)section;

- (TBaseTableViewCell *)t_cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol TBaseTableViewDelegate <NSObject>

@required

- (CGFloat)t_heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)t_didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

#pragma mark  ===== 逻辑处理  用于处理加载更多 页面刷新
@protocol TBaseLogicDelegate <NSObject>

- (void)t_headerFreshViewLoading;

- (void)t_footerFreshViewLoading;

@end


@interface TBaseTableViewController : TBaseViewController

@property (nonatomic,assign)  id<TBaseTableViewDelegate> delegate;

@property (nonatomic,assign)  id<TBaseTableViewDatasource> datasource;

@property (nonatomic,assign)  id<TBaseLogicDelegate>   logicDelegate;

@property (nonatomic,assign)  BOOL  t_header;

@property (nonatomic,assign)  BOOL  t_footer;

@property (nonatomic,assign)  BOOL  t_error_self;

- (void)endRefreshing:(BOOL)noMore;

@end
