//
//  TTDataService.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/11.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "TTDataService.h"

@implementation TTDataService
+ (instancetype)sharedManager
{
    static TTDataService *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:URLHEAD]];
    });
    return manager;
}
-(instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        // 请求超时设定
        self.requestSerializer.timeoutInterval = 30;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        
        self.securityPolicy.allowInvalidCertificates = YES;
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(id)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure
{
    

    switch (method) {
        case GET:{
            [self GET:path parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if ([responseObject[@"respCode"] integerValue]<0) {
                        failure(responseObject[@"respMsg"]);
                    }
                    else
                    {
                        success(responseObject[@"data"]);
                    }
                    NSLog(@"接口请求返回结果\n%@",responseObject);
                });
                
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    failure(error.localizedDescription);
                });
            }];
            break;
        }
        case POST:{
            [self POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        NSDictionary * responseObj = (NSDictionary *)responseObject;
                        if ([responseObj[@"respCode"] integerValue]<0) {
                            failure(responseObj[@"respMsg"]);
                        }
                        else
                        {
                            success(responseObj[@"data"]);
                        }
                        NSLog(@"接口请求返回结果\n%@",responseObj);
                    }
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    failure(error.localizedDescription);
                });
            }];
            break;
        }
            
            break;
        default:
            break;
    }
}
-(void)postImageWithPath:(NSString *)path
          WithParameters:(id)parameters
            WithFilePath:(NSString *)filePath
        WithSuccessBlock:(requestSuccessBlock)success
         WithFailurBlock:(requestFailureBlock)failure
{

    [self POST:path parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /******** 1.上传已经获取到的img *******/
        UIImage * upImg = [UIImage imageWithContentsOfFile:filePath];
        // 把图片转换成data
        NSData *data = UIImagePNGRepresentation(upImg);
        // 拼接数据到请求题中
        [formData appendPartWithFileData:data name:@"file" fileName:[filePath lastPathComponent] mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 打印上传进度
        NSLog(@"%lf",1.0 *uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        NSLog(@"请求成功：%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSLog(@"请求失败：%@",error);
    }];
    
}
-(void)downloadFileWithUrl:(NSString *)url
         WithDownloadBlock:(downloadBlock)download
          WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure
{
    /* 创建网络下载对象 */
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    /* 下载地址 */
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    /* 下载路径 */
    NSString *path = [NSHomeDirectory() stringByAppendingString:@"Documents"];
    NSString *filePath = [path stringByAppendingPathComponent:url.lastPathComponent];
    
    /* 开始请求下载 */
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"下载进度：%.0f％", downloadProgress.fractionCompleted * 100);
            
            download(downloadProgress.fractionCompleted);
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        /* 设定下载到的位置 */
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        NSLog(@"下载完成");
        failure(error.localizedDescription);
    }];
    [downloadTask resume];
}
@end
