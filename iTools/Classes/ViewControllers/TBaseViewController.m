//
//  TBaseViewController.m
//  iTools
//
//  Created by admin on 2017/8/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TBaseViewController.h"
#import "TErrorPageView.h"

@interface TBaseViewController ()
{
    TErrorPageView    *t_error_view;
}
@end

@implementation TBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    [self InitErrorPageView];
}

- (void)setT_error:(BOOL)t_error{
    t_error_view.alpha = t_error;
}

- (void)InitErrorPageView{
    if (t_error_view == nil) {
        t_error_view  = [[TErrorPageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        __weak typeof(self) weakSelf = self;
        t_error_view.refreshBlock = ^{
            if ([weakSelf.error_delegate respondsToSelector:@selector(t_errorPageRefreshClick)]) {
                [weakSelf.error_delegate t_errorPageRefreshClick];
            }
        };
    }
    [self.view addSubview:t_error_view];
}


@end
