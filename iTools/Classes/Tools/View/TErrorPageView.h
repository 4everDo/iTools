//
//  TErrorPageView.h
//  iTools
//
//  Created by admin on 2017/8/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^kRefreshClickBlock)();

@interface TErrorPageView : UIView

@property (nonatomic,copy) kRefreshClickBlock refreshBlock;

@end
