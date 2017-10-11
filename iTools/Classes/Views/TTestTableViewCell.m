//
//  TTestTableViewCell.m
//  iTools
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTestTableViewCell.h"
#import "TTestModel.h"


@interface TTestTableViewCell()
{
    UILabel     *nameLabel;
}
@end

@implementation TTestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self layoutSubView];
    return self;
}
- (void)layoutSubView{
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
    nameLabel.textColor = [UIColor blueColor];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.text = @"测试";
    [self.contentView addSubview:nameLabel];
}

- (void)reloadBaseTableViewCell:(TTestModel *)entity{
    nameLabel.text = entity.name;
}

@end
