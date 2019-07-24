//
//  TBaseTableViewCell.m
//  iTools
//
//  Created by admin on 2017/8/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TBaseTableViewCell.h"


@interface TBaseTableViewCell()
{
    UIView      *lineView;
}
@end

@implementation TBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutBaseTableView];
    }
    return self;
}

- (void)layoutBaseTableView{
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, [[self class] layoutHeightWithEntity:nil] - 1, T_SCREEN_WIDTH, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:225/255.f green:225/255.f blue:225/255.f alpha:1];
    lineView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    [self.contentView addSubview:lineView];
}

- (void)setSeparatorInsets:(HorizontalEdgeInsets)separatorInsets {
    _separatorInsets = separatorInsets;
    lineView.left = separatorInsets.left;
    lineView.right = separatorInsets.right;
}

- (void)setIsSepatator:(BOOL)isSepatator {
    _isSepatator = isSepatator;
    if (isSepatator) {
        [self.contentView bringSubviewToFront:lineView];
    }
}

+ (CGFloat)layoutHeightWithEntity:(TBaseModel *)entity {
    return 50;
}

@end
