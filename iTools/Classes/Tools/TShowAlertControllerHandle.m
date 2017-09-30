//
//  TShowAlertControllerHandle.m
//
//  Created by admin on 2017/9/14.
//  Copyright © 2017年 GOGenius. All rights reserved.
//

#import "TShowAlertControllerHandle.h"

static UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>  *staticTarget = nil;

@implementation TShowAlertControllerHandle

+ (void)showAlertController:(UIViewController *)target titles:(NSArray *)titles style:(UIAlertControllerStyle)style selected:(void (^)(NSInteger index))selected {
    UIAlertController *c = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:style];
    [c addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
       
    }]];
    for (int i=0;i<titles.count;i++) {
        NSString *title = titles[i];
        [c addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (selected) {
                selected(i);
            }
        }]];
    }
    [target presentViewController:c animated:YES completion:nil];
}

+ (void)showAlertControllerWith:(UIViewController *)target title:(NSString *)title message:(NSString *)message otherButtonTitles:(NSArray *)titles selected:(void (^)(NSInteger index))selected {
    UIAlertController *c = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [c addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    for (int i=0;i<titles.count;i++) {
        NSString *title = titles[i];
        [c addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (selected) {
                selected(i);
            }
        }]];
    }
    [target presentViewController:c animated:YES completion:nil];
}


- (void)showAlertControllerWithPhoto:(UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate> *)target {
    staticTarget = target;
    [[self class] showAlertController:target titles:@[@"相机",@"相册"] style:UIAlertControllerStyleActionSheet selected:^(NSInteger index) {
        if (index == 0) {
            [self openCamera];
        }else{
            [self openPhotoLibrary];
        }
    }];
}

- (void)openCamera {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImagePickerController  *pickerController = [[UIImagePickerController alloc]init];
    pickerController.delegate = staticTarget;
    pickerController.sourceType = sourceType;
    [staticTarget presentViewController:pickerController animated:YES completion:nil];
}

- (void)openPhotoLibrary {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = staticTarget;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [staticTarget presentViewController:picker animated:YES completion:nil];
}

@end
