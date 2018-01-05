//
//  THUD.h
//  iTools
//
//  Created by Mac on 2018/1/5.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THUD : NSObject
// 单例
+ (THUD *)instance;

// 简单的显示text
+ (void)showContent:(NSString *)content;

// 是否禁止操作  lock 锁住操作 不自动消失
+ (void)showContent:(NSString *)content needLock:(BOOL)lock;

// 显示一段时间
+ (void)showContent:(NSString *)content withTime:(CGFloat)time;

//
+ (void)showContent:(NSString *)content withTime:(CGFloat)time inView:(UIView *)view;

// 显示图片
+ (void)showImage:(UIImage *)image;

// 显示图片文字一段时间
+ (void)showImage:(UIImage *)image content:(NSString *)content withTime:(CGFloat)time;

//
+ (void)showImage:(UIImage *)image content:(NSString *)content withTime:(CGFloat)time inView:(UIView *)view;

//
+ (void)showImage:(UIImage *)image content:(NSString *)content needLock:(BOOL)lock inView:(UIView *)view;

// 显示菊花
+ (void)showActivityIndicatorInView:(UIView *)view needLock:(BOOL)lock;

+ (void)dismiss;

@end

@interface THudView : UIView

- (void)layoutWith:(UIImage *)image content:(NSString *)content activity:(BOOL)activity;

@end
