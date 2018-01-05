//
//  TShowAlertControllerHandle.h
//
//  Created by admin on 2017/9/14.
//  Copyright © 2017年 GOGenius. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 需实现代理方法
 */
@interface TShowAlertControllerHandle : NSObject

/**
 弹出框 sheet

 @param target vc
 @param titles button titles
 @param style 类型
 @param selected 选中
 */
+ (void)showAlertController:(UIViewController *)target titles:(NSArray *)titles style:(UIAlertControllerStyle)style selected:(void (^)(NSInteger index))selected;


/**
 alertView

 @param target vc
 @param title title
 @param message message
 @param titles button titles
 @param selected 选中
 */
+ (void)showAlertControllerWith:(UIViewController *)target title:(NSString *)title message:(NSString *)message otherButtonTitles:(NSArray *)titles selected:(void (^)(NSInteger index))selected;


/**
 只有取消按钮的弹出框

 @param target 代理
 @param title 名称
 @param message 消息
 @param buttonName 取消按钮title
 @param cancel 取消回掉方法
 */
+ (void)showAlertControllerCancel:(UIViewController *)target title:(NSString *)title message:(NSString *)message buttonName:(NSString *)buttonName cancel:(void (^)(void))cancel;

/**
 相册选择
 
 @param target c
 */
- (void)showAlertControllerWithPhoto:(UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate> *)target;


@end
