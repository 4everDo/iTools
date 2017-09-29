//
//  TBaseTableViewCell.m
//  iTools
//
//  Created by admin on 2017/8/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TBaseTableViewCell.h"

@implementation TBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutBaseTableView];
    }
    return self;
}

- (void)layoutBaseTableView{
    
}

- (CGFloat)layoutHeightWithEntity:(TBaseModel *)entity{
    return 50;
}

@end
