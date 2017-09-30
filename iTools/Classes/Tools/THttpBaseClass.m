//
//  THttpBaseClass.m
//  iTools
//
//  Created by admin on 2017/7/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "THttpBaseClass.h"



@implementation THttpBaseClass

+ (THttpBaseClass *)shareSingletenManager{
    static  THttpBaseClass *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[self alloc] init];
    });
    return tool;
}


- (void)t_HttpManagerRequestGET:(NSString *)urlString
                          param:(NSDictionary *)param
                successComplate:(void (^)(NSDictionary *result))complate
                   failComplate:(void (^)(NSError *error))failComplate{
    AFHTTPSessionManager *manager = [[self class] shareSingletenManager];
    [[manager GET:urlString
                   parameters:param
                     progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                          NSMutableDictionary *resultDic = [[NSMutableDictionary alloc] initWithDictionary:(NSDictionary *)responseObject];
                          if (complate) {
                              complate(resultDic);
                          }
    }
                      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                          
    }] resume];
}


- (void)t_HttpManagerRequestPOST:(NSString *)urlString
                           param:(NSDictionary *)param
                 successComplate:(void (^)(NSDictionary *result))complate
                    failComplate:(void (^)(NSError *error))failComplate{
    AFHTTPSessionManager *manager = [[self class] shareSingletenManager];
    [[manager POST:urlString
       parameters:param
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSMutableDictionary *resultDic = [[NSMutableDictionary alloc] initWithDictionary:(NSDictionary *)responseObject];
              if (complate) {
                  complate(resultDic);
              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
    }] resume];
}

- (void)t_HttpManagerRequestUpload:(NSString *)urlString
                             param:(NSDictionary *)param
                            titles:(NSArray *)titles
                             datas:(NSArray *)datas
                         voiceData:(NSData *)voiceData
                          progress:(void (^)(int64_t uploadProgress))uploadProgress
                   successComplate:(void (^)(NSDictionary *result))complate
                      failComplate:(void (^)(NSError *error))failComplate{
    AFHTTPSessionManager *manager = [[self class] shareSingletenManager];
    [[manager POST:urlString
       parameters:param
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    if (datas.count==titles.count) {
        for (int i=0; i<datas.count; i++) {
            [formData appendPartWithFileData:datas[i] name:titles[i] fileName:[NSString stringWithFormat:@"header%@.jpg",@(i)] mimeType:@"image/jpeg"];
        }
    }else{
        for (int i=0; i<datas.count; i++) {
            [formData appendPartWithFileData:datas[i] name:titles[0] fileName:[NSString stringWithFormat:@"header%@.jpg",@(i)] mimeType:@"image/jpeg"];
        }
    }
    if (voiceData) {
        [formData appendPartWithFileData:voiceData name:@"voice" fileName:@"mp3.mp3" mimeType:@"amr/mp3/wmr"];
    }
}
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSMutableDictionary *resultDic = [[NSMutableDictionary alloc] initWithDictionary:(NSDictionary *)responseObject];
              if (complate) {
                  complate(resultDic);
              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
    }] resume];
}


- (void)t_HttpManagerRequestDownload:(NSString *)urlString
                               param:(NSDictionary *)param
                            progress:(void (^)(int64_t downloadProgress))downloadProgress
                     successComplate:(void (^)(NSDictionary *result))complate
                        failComplate:(void (^)(NSError *error))failComplate{
    
}

- (void)t_HttpManagerRequestMethod:(TRequestMethodType)type
                               URL:(NSString *)urlString
                             param:(NSDictionary *)param
                   successComplate:(void (^)(NSDictionary *result))complate
                      failComplate:(void (^)(NSError *error))failComplate {
    if (type == TRequestMethodGET) {
        [self t_HttpManagerRequestGET:urlString param:param successComplate:complate failComplate:failComplate];
    }else if (type == TRequestMethodPOST) {
        [self t_HttpManagerRequestPOST:urlString param:param successComplate:complate failComplate:failComplate];
    }
}
@end
