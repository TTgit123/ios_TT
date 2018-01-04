//
//  TKDataService.m
//  TKVerb
//
//  Created by 妥妥 on 2017/12/29.
//  Copyright © 2017年 妥妥. All rights reserved.
//

#import "TKDataService.h"

@implementation TKDataService
+ (instancetype)sharedManager
{
    static TKDataService *manager = nil;
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
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        bool isSuccess = [responseObject[@"success"] boolValue];
                        if (isSuccess == true)
                        {
                            id resultObj = responseObject[@"result"];
                            //if ([json[@"result"] isKindOfClass:[NSString class]])
                            if ([resultObj isKindOfClass:[NSString class]])
                            {
                                NSData *data = [resultObj dataUsingEncoding:NSUTF8StringEncoding];
                                id topdata = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                success(topdata);
                            }
                            else
                            {
                                success(resultObj);
                            }
                        }
                        else
                        {
                            success(responseObject);
                        }
                    }
                    else
                    {
                        success(responseObject);
                    }
                });
                
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    failure(error.localizedDescription);
                });
            }];
            break;
        }
        case POST:{

            break;
        }
        case SIGNPOST:{

          
        }
            break;
        default:
            break;
    }
}
@end
