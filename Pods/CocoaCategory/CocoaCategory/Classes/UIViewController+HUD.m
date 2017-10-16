//
//  UIViewController+HUD.m
//  CocoaCategory
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UIViewController+HUD.h"
#import <objc/runtime.h>

@implementation UIViewController (HUD)


- (void)showHUDDefaultLoadingText {
    [self showHUDText:@"Loading..."];
}

- (void)showHUDText:(NSString *)text {
    [self showHUDText:text mode:MBProgressHUDModeIndeterminate];
}

- (void)showHUDText:(NSString *)text afterDealy:(NSTimeInterval)afterDealy{
    [self showHUDText:text mode:MBProgressHUDModeText afterDealy:afterDealy];
}

- (void)showHUDTextAfterDealy:(NSString *)text {
    [self showHUDText:text mode:MBProgressHUDModeText afterDealy:2.0f];
}

- (void)showHUDText:(NSString *)text mode:(MBProgressHUDMode)mode {
    [self showHUDText:text mode:mode afterDealy:0];
}

- (void)showHUDText:(NSString *)text mode:(MBProgressHUDMode)mode afterDealy:(NSTimeInterval)afterDealy {
    if (self.isLoadingHUD) {
        return;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = mode;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    if (afterDealy > 0) {
        hud.detailsLabel.text = text;
    } else {
        hud.label.text = text;
    }
    
    objc_setAssociatedObject(self, "MBProgressHUD", hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (afterDealy > 0 && mode == MBProgressHUDModeText) {
        [hud hideAnimated:YES afterDelay:afterDealy];
    }
}

- (void)hideHUD {
    [self hideHUDTextAfterDealy:nil];
}

- (void)hideHUDTextAfterDealy:(NSString *)text {
    [self hideHUDText:text afterDealy:2.0];
}

- (void)hideHUDText:(NSString *)text afterDealy:(NSTimeInterval )afterDealy {
    if (!self.isLoadingHUD) {
        return;
    }
    MBProgressHUD *hud = objc_getAssociatedObject(self, "MBProgressHUD");
    if (!text) {
        [hud hideAnimated:YES];
    }else {
        hud.label.text = nil;
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = text;
        hud.label.font = [UIFont systemFontOfSize:13];
        [hud hideAnimated:YES afterDelay:afterDealy];
    }
}

#pragma mark - get

- (BOOL)isLoadingHUD {
    MBProgressHUD *hud = objc_getAssociatedObject(self, "MBProgressHUD");
    return hud.superview?YES:NO;;
}


@end
