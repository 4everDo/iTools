//
//  THttpBaseClass.h
//  iTools
//
//  Created by admin on 2017/7/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>


typedef NS_ENUM(NSInteger,TRequestMethodType){
    TRequestMethodGET,
    TRequestMethodPOST,
    TRequestMethodUpload,
    TRequestMethodDownload,
};


@interface THttpBaseClass : AFHTTPSessionManager

+ (THttpBaseClass *)shareSingletenManager;

/**
 GET

 @param urlString URL
 @param param 参数
 @param complate 完成
 @param failComplate 失败
 */
- (void)t_HttpManagerRequestGET:(NSString *)urlString
                          param:(NSDictionary *)param
                successComplate:(void (^)(NSDictionary *result))complate
                   failComplate:(void (^)(NSError *error))failComplate;



/**
 POST

 @param urlString url
 @param param 参数
 @param complate 完成
 @param failComplate 失败
 */
- (void)t_HttpManagerRequestPOST:(NSString *)urlString
                           param:(NSDictionary *)param
                 successComplate:(void (^)(NSDictionary *result))complate
                    failComplate:(void (^)(NSError *error))failComplate;



/**
 UPLOAD

 @param urlString URL
 @param param 参数
 @param uploadProgress 上传进度
 @param complate 完成
 @param failComplate 失败
 */
- (void)t_HttpManagerRequestUpload:(NSString *)urlString
                             param:(NSDictionary *)param
                            titles:(NSArray *)titles
                             datas:(NSArray *)datas
                         voiceData:(NSData *)voiceData
                          progress:(void (^)(int64_t uploadProgress))uploadProgress
                   successComplate:(void (^)(NSDictionary *result))complate
                      failComplate:(void (^)(NSError *error))failComplate;


/**
 DOWNLOAD

 @param urlString URL
 @param param 参数
 @param downloadProgress 下载进度
 @param complate 完成
 @param failComplate 失败
 */
- (void)t_HttpManagerRequestDownload:(NSString *)urlString
                               param:(NSDictionary *)param
                            progress:(void (^)(int64_t downloadProgress))downloadProgress
                     successComplate:(void (^)(NSDictionary *result))complate
                        failComplate:(void (^)(NSError *error))failComplate;


/**
 私有方法

 @param type 类型
 @param urlString url
 @param param 参数
 @param complate 完成
 @param failComplate 失败
 */
- (void)t_HttpManagerRequestMethod:(TRequestMethodType)type
                               URL:(NSString *)urlString
                             param:(NSDictionary *)param
                   successComplate:(void (^)(NSDictionary *result))complate
                      failComplate:(void (^)(NSError *error))failComplate;

@end
