//
//  TErrorPageView.m
//  iTools
//
//  Created by admin on 2017/8/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TErrorPageView.h"

@implementation TErrorPageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor redColor];
    [self addTargetWithClick];
    return self;
}

- (void)addTargetWithClick{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    [self addGestureRecognizer:tap];
}

- (void)click:(UITapGestureRecognizer *)tap{
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}

@end
