//
//  TodayViewController.m
//  iToolWIdget
//
//  Created by admin on 2017/8/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
{
    UIButton      *qrCodeImageView;
    
    UIView        *view1;
    UIView        *view2;
    
    NSString      *qrCodeString;
}
@end

@implementation TodayViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0) {
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    qrCodeString = [self readDataFromNSUserDefaults];
    [self view1];
    [self view2];
    view1.alpha = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return UIEdgeInsetsMake(0, 10, 10, 10);
}


- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{
    
    if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110+100);
        view1.alpha = 0;
        view2.alpha = 1;
    }else{
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
        view1.alpha = 1;
        view2.alpha = 0;
    }
}

- (void)view1{
    if (view1 == nil) {
        view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-40, 90)];
        [view1 setBackgroundColor:[UIColor clearColor]];
        [self addAction];
    }
    [self.view addSubview:view1];
}

- (void)view2{
    if (view2 == nil) {
        view2 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width-40, 100+ 100)];
        [view2 setBackgroundColor:[UIColor clearColor]];
        [self buildQRCodeImage];
    }
    [self.view addSubview:view2];
}

- (void)addAction{
    CGFloat space = 10;
    CGFloat width = ([[UIScreen mainScreen] bounds].size.width-40 - 3*space)/4;
    NSArray  *imageArray = @[@"home_kuaidi_logo",@"home_opendoor_logo",@"home_parking_logo",@"home_zhinan_logo"];
    NSArray  *titleArray = @[@"快递",@"开门",@"停车",@"指南"];
    for (int i=0; i<4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*(space+width), 0, width, width);
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [view1 addSubview:btn];
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel  *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn.frame), width, 20)];
        [titleLabel setText:titleArray[i]];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setTextColor:[UIColor blueColor]];
        [titleLabel setFont:[UIFont systemFontOfSize:12]];
        [view1 addSubview:titleLabel];
    }
}
- (void)buildQRCodeImage{
    UIImage *image = [UIImage imageNamed:@"home_rqcode_image"];
    qrCodeImageView = [UIButton buttonWithType:UIButtonTypeCustom];
    [qrCodeImageView setFrame:CGRectMake((CGRectGetWidth(view2.frame)-image.size.width-20)/2, 10, image.size.width+20, image.size.height+20)];
    [qrCodeImageView setImage:[self buildQRCode:qrCodeString withSize:CGSizeMake(CGRectGetWidth(qrCodeImageView.frame),CGRectGetHeight(qrCodeImageView.frame))] forState:UIControlStateNormal];
    [qrCodeImageView addTarget:self action:@selector(updateQRCode:) forControlEvents:UIControlEventTouchUpInside];
    [view2 addSubview:qrCodeImageView];
}
- (void)btnPress:(UIButton *)btn{
    NSArray *arr = @[@"0",@"1",@"2",@"3"];
    
    NSString *url_Str = [NSString stringWithFormat:@"gogeniusWidget://%@",arr[btn.tag-100]];
    NSURL *url = [NSURL URLWithString:url_Str];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        
    }];
}

- (void)updateQRCode:(id)sender{
    NSString *url_Str = [NSString stringWithFormat:@"gogeniusWidget://"];
    NSURL *url = [NSURL URLWithString:url_Str];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        [qrCodeImageView setImage:[self buildQRCode:[self readDataFromNSUserDefaults] withSize:CGSizeMake(CGRectGetWidth(qrCodeImageView.frame),CGRectGetHeight(qrCodeImageView.frame))] forState:UIControlStateNormal];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view layoutIfNeeded];
        });

    }];
}

- (NSString *)readDataFromNSUserDefaults{
    NSUserDefaults *shared = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.gogen.ios.gogenius"];
    NSString *value = [shared valueForKey:@"widget"];
    return value;
}

- (UIImage *)buildQRCode:(NSString *)string withSize:(CGSize)size{
    CIImage *imgQRCode = [KMQRCode createQRCodeImage:string];
    return [KMQRCode resizeQRCodeImage:imgQRCode withSize:size.width];
}
@end
