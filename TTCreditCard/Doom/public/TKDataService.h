//
//  TKDataService.h
//  TKVerb
//
//  Created by 妥妥 on 2017/12/29.
//  Copyright © 2017年 妥妥. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "AppDelegate.h"

//请求方法define
typedef enum {
    GET,
    POST,
    SIGNPOST,
} HTTPMethod;

@interface TKDataService : AFHTTPSessionManager
{
    AppDelegate *_appDelegate;
}
//请求成功回调block
typedef void (^requestSuccessBlock)(id result);
//请求失败回调block
typedef void (^requestFailureBlock)(NSString *error);
+ (instancetype)sharedManager;

- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(id)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;
@end
