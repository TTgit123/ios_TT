//
//  AppDelegate+TTCreditCard.h
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/8.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "AppDelegate.h"
#import "TTRootViewController.h"
// 引入JPush功能所需头文件
#import "JPUSHService.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

#define PushAppKey @""
#define PushChannel @"App Store"
#define PushIsProduction NO
@interface AppDelegate (TTCreditCard)<JPUSHRegisterDelegate>
-(void)TTRootViewController;//初始化控制器
-(void)TTPushWithLaunchOptions:(NSDictionary *)launchOptions;//初始化极光推送
@end
