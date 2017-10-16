//
//  UIViewController+HUD.h
//  CocoaCategory
//
//  Created by Mac on 2017/10/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIViewController (HUD)

@property (nonatomic, assign, readonly) BOOL isLoadingHUD;

- (void)showHUDDefaultLoadingText;
/*!
 *  @brief 展示HUD 不会自动的消失 默认为MBProgressHUDModeIndeterminate类型
 *
 *  @param text 显示的Text
 */
- (void)showHUDText:(NSString *)text;
/*!
 *  @brief 1.5秒会自动消失 MBProgressHUDModeText类型
 *
 *  @param text 显示的Text
 */
- (void)showHUDTextAfterDealy:(NSString *)text;
/*!
 *  @brief 多少秒后会自动的消失
 *
 *  @param text       显示的Text
 *  @param afterDealy 显示多少秒
 */
- (void)showHUDText:(NSString *)text afterDealy:(NSTimeInterval)afterDealy;
/*!
 *  @brief 设置为Mode类型 不会自动的消失
 *
 *  @param text 显示的Text
 *  @param mode MBProgressHUDMode
 */
- (void)showHUDText:(NSString *)text mode:(MBProgressHUDMode)mode;
/*!
 *  @brief 立刻消失
 */
- (void)hideHUD;
/*!
 *  @brief 先提示文本 之后1.5秒消失
 *
 *  @param text 显示的Text
 */
- (void)hideHUDTextAfterDealy:(NSString *)text;
/*!
 *  @brief 多少秒后消失
 *
 *  @param text       text 显示的Text
 *  @param afterDealy 多少秒
 */
- (void)hideHUDText:(NSString *)text afterDealy:(NSTimeInterval )afterDealy;

@end
