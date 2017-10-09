//
//  TBaseViewController.h
//  iTools
//
//  Created by admin on 2017/8/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TErrorPageRefreshDelegate <NSObject>

- (void)t_errorPageRefreshClick;

@end

@interface TBaseViewController : UIViewController

@property (nonatomic,assign) id <TErrorPageRefreshDelegate>  error_delegate;

@property (nonatomic,assign) BOOL  t_error;  //错误页面

@end
