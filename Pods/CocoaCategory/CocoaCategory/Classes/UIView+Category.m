//
//  UIView+Category.m
//  iTools
//
//  Created by admin on 2017/8/29.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

#pragma mark  Setter
- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

#pragma mark  Getter
- (CGFloat)top {
    return self.frame.origin.y;
}
- (CGFloat)bottom {
    return self.frame.size.height + self.frame.origin.y;
}
- (CGFloat)left {
    return self.frame.origin.x;
}
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)height {
    return self.frame.size.height;
}
- (CGFloat)width {
    return self.frame.size.width;
}




- (void)removeAllSubViews {
    for (id obj in self.subviews) {
        [obj removeFromSuperview];
    }
}

@end
