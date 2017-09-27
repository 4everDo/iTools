//
//  UIHandle.m
//  Start-up.Company.Project
//
//  Created by Mac on 16/6/27.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UIHandle.h"

@implementation UIHandle

+ (UILabel *)buildCustomLabel:(CGRect)rect text:(NSString *)text alt:(NSTextAlignment)algnment textFont:(UIFont *)font textColor:(UIColor *)textColor{
    UILabel *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = algnment;
    label.font = font;
    return label;
}

+ (UILabel *)buildContainPlaceholderLabel:(CGRect)rect
                                     text:(NSString *)text
                                      alt:(NSTextAlignment)alt
                                 textFont:(UIFont *)font
                                textColor:(UIColor *)textColor
                              placeholder:(NSString *)placeholder
                         placeholderColor:(UIColor *)holderColor
                          placeholderFont:(UIFont *)holderFont{
    UILabel  *label = [[self class] buildCustomLabel:rect text:text alt:alt textFont:font textColor:textColor];
    if (text.length == 0) {
        label.text = placeholder;
        label.textColor = holderColor;
        label.font = holderFont;
    }
    return label;
}

+ (UIButton *)buildCustomButton:(CGRect)rect
                         target:(id)target
                        selecor:(SEL)selecor
                      titleText:(NSString *)title
                            alt:(NSTextAlignment)algnment
                       textFont:(UIFont *)font
                      textColot:(UIColor *)textColor
                backgroundColor:(UIColor *)backgroundColor
                          layer:(CALayer *)layer{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:backgroundColor];
    [btn setFrame:rect];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    [btn.titleLabel setFont:font];
    [btn addTarget:target action:selecor forControlEvents:UIControlEventTouchUpInside];
    [btn.titleLabel setTextAlignment:algnment];
    [btn.layer addSublayer:layer];
    return btn;
}

+ (UITableView *)buildCustomTableView:(CGRect)rect
                             delegate:(id)delegate
                           datasource:(id)datasource
                              bounces:(BOOL)bounces
                       separatorStyle:(UITableViewCellSeparatorStyle)separatorStyle
                      backgroundColor:(UIColor*)backgroundColor{
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    tableView.delegate = delegate;
    tableView.dataSource = datasource;
    tableView.bounces = bounces;
    tableView.backgroundColor = backgroundColor;
    tableView.separatorStyle = separatorStyle;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    return tableView;
}
+ (UITextField *)buildCustomTextField:(CGRect)rect
                                 text:(NSString *)text
                            textColor:(UIColor *)textColor
                             textFont:(UIFont *)textFont
               userInteractionEnabled:(BOOL)userInteractionEnabled
                      secureTextEntry:(BOOL)secureTextEntry
                          placeholder:(NSString *)placeholder
                     placeholderColor:(UIColor *)placeholderColor
                      placeholderFont:(UIFont *)placeholderFont
                             delegate:(id)target{
     UITextField *textField = [[UITextField alloc] initWithFrame:rect];
     textField.text=text;
     [textField setTextColor:textColor];
     [textField setFont:textFont];
     textField.placeholder = placeholder;
     textField.userInteractionEnabled = userInteractionEnabled;
     textField.secureTextEntry = secureTextEntry;
     [textField setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
     [textField setValue:placeholderFont forKeyPath:@"_placeholderLabel.font"];
     textField.delegate = target;
    [[UITextField appearance] setTintColor:[UIColor whiteColor]];
     return textField;
}

@end
