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


- (void)showAlertControllerWithPhoto:(UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate> *)target;


@end
