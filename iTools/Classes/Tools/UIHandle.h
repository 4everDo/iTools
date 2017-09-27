//
//  UIHandle.h
//  Start-up.Company.Project
//
//  Created by Mac on 16/6/27.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIHandle : NSObject

+ (UILabel *)buildCustomLabel:(CGRect)rect
                         text:(NSString *)text
                          alt:(NSTextAlignment)algnment
                     textFont:(UIFont *)font
                    textColor:(UIColor *)textColor;
+ (UILabel *)buildContainPlaceholderLabel:(CGRect)rect
                                     text:(NSString *)text
                                      alt:(NSTextAlignment)alt
                                 textFont:(UIFont *)font
                                textColor:(UIColor *)textColor
                              placeholder:(NSString *)placeholder
                         placeholderColor:(UIColor *)holderColor
                          placeholderFont:(UIFont *)holderFont;

+ (UIButton *)buildCustomButton:(CGRect)rect
                         target:(id)target
                        selecor:(SEL)selecor
                      titleText:(NSString *)title
                            alt:(NSTextAlignment)algnment
                       textFont:(UIFont *)fonte
                      textColot:(UIColor *)textColor
                backgroundColor:(UIColor *)backgroundColor
                          layer:(CALayer *)layer;

+ (UITableView *)buildCustomTableView:(CGRect)rect
                             delegate:(id)delegate
                           datasource:(id)datasource
                              bounces:(BOOL)bounces
                       separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
                      backgroundColor:(UIColor*)backgroundColor;

+ (UITextField *)buildCustomTextField:(CGRect)rect
                                 text:(NSString *)text
                            textColor:(UIColor *)textColor
                             textFont:(UIFont *)textFont
               userInteractionEnabled:(BOOL)userInteractionEnabled
                      secureTextEntry:(BOOL)secureTextEntry
                          placeholder:(NSString *)placeholder
                     placeholderColor:(UIColor *)placeholderColor
                      placeholderFont:(UIFont *)placeholderFont
                             delegate:(id)target;

@end
