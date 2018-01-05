//
//  ViewController.m
//  iTools
//
//  Created by admin on 2017/7/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "ListModel.h"

@interface ViewController ()
{
    UILabel  *label;
    ListModel *model;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestQBData {
//    []
}


- (TBaseModel *)configDatasource {
    model = [[ListModel alloc] init];
    return model;
}

- (void)reloadResult:(BOOL)success {
    
}


@end
