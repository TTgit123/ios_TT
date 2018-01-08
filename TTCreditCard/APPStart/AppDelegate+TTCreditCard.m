//
//  AppDelegate+TTCreditCard.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/8.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "AppDelegate+TTCreditCard.h"

@implementation AppDelegate (TTCreditCard)
-(void)TTRootViewController
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    TTRootViewController *tabBarVc = [[TTRootViewController alloc] init];
    CATransition *anim = [[CATransition alloc] init];
    anim.type = @"rippleEffect";
    anim.duration = 1.0;
    [self.window.layer addAnimation:anim forKey:nil];
    self.window.rootViewController = tabBarVc;
    [self.window makeKeyAndVisible];
}
-(void)TTPushWithLaunchOptions:(NSDictionary *)launchOptions
{
     //极光推送
     JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
     entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
     if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
     // 可以添加自定义categories
     // NSSet<UNNotificationCategory *> *categories for iOS10 or later
     // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
     }
     [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
     
     [JPUSHService setupWithOption:launchOptions appKey:PushAppKey
     channel:PushChannel
     apsForProduction:PushIsProduction];
    /*#########################################################################################*/
}
/* ------------------------------------------放开解放极光推送
 #pragma mark - 注册APNS成功
 - (void)application:(UIApplication *)application
 didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
 
 /// Required - 注册 DeviceToken
 [JPUSHService registerDeviceToken:deviceToken];
 }
 #pragma mark - 注册APNS失败
 - (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
 //Optional
 NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
 }
 #pragma mark- JPUSHRegisterDelegate
 #if _IPHONE_10_0
 
 // iOS 10 Support
 - (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
 // Required
 NSDictionary * userInfo = notification.request.content.userInfo;
 if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
 [JPUSHService handleRemoteNotification:userInfo];
 }
 completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
 }
 
 // iOS 10 Support
 - (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
 // Required
 NSDictionary * userInfo = response.notification.request.content.userInfo;
 if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
 [JPUSHService handleRemoteNotification:userInfo];
 }
 completionHandler();  // 系统要求执行这个方法
 }
 #endif
 - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
 
 // Required, iOS 7 Support
 [JPUSHService handleRemoteNotification:userInfo];
 completionHandler(UIBackgroundFetchResultNewData);
 }
 
 - (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
 
 // Required,For systems with less than or equal to iOS6
 [JPUSHService handleRemoteNotification:userInfo];
 }
 */
@end
