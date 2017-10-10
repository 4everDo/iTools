//
//  UIView+Category.h
//  iTools
//
//  Created by admin on 2017/8/29.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

@property (nonatomic) CGFloat  left;
@property (nonatomic) CGFloat  right;
@property (nonatomic) CGFloat  top;
@property (nonatomic) CGFloat  bottom;
@property (nonatomic) CGFloat  height;
@property (nonatomic) CGFloat  width;

- (void)removeAllSubViews;

@end
