//
//  TTDataService.h
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/11.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "AppDelegate.h"
//请求方法define
typedef enum {
    GET,
    POST,
} HTTPMethod;
@interface TTDataService : AFHTTPSessionManager
//请求成功回调block
typedef void (^requestSuccessBlock)(id result);
//请求失败回调block
typedef void (^requestFailureBlock)(NSString *error);
//进度回调block
typedef void (^downloadBlock)(CGFloat downloadFloat);
//单例化
+ (instancetype)sharedManager;
//网络请求
- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(id)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;
//上传文件
-(void)postImageWithPath:(NSString *)path
          WithParameters:(id)parameters
            WithFilePath:(NSString *)filePath
        WithSuccessBlock:(requestSuccessBlock)success
         WithFailurBlock:(requestFailureBlock)failure;
//下载文件
-(void)downloadFileWithUrl:(NSString *)url
         WithDownloadBlock:(downloadBlock)download
          WithSuccessBlock:(requestSuccessBlock)success
           WithFailurBlock:(requestFailureBlock)failure;
@end
