//
//  TTCode.h
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/6.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#ifndef TTCode_h
#define TTCode_h

/*###########################################################################################################*/
//屏幕宽高
#define KWight [UIScreen mainScreen].bounds.size.width
#define KHight [UIScreen mainScreen].bounds.size.height


/*###########################################################################################################*/
//判断设备类型
#define iPhone4 ([UIScreen mainScreen].bounds.size.height == 480)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)

#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


/*###########################################################################################################*/
//判断系统版本
#define IOS_7 @available(iOS 7.0, *)
#define IOS_8 @available(iOS 8.0, *)
#define IOS_9 @available(iOS 9.0, *)
#define IOSVersion_4          (DEVICE_OS_VERSION_VALUE >= 4.0  && DEVICE_OS_VERSION_VALUE < 5.0)
#define IOSVersion_5          (DEVICE_OS_VERSION_VALUE >= 5.0  && DEVICE_OS_VERSION_VALUE < 6.0)
#define IOSVersion_6          (DEVICE_OS_VERSION_VALUE >= 6.0  && DEVICE_OS_VERSION_VALUE < 7.0)
#define IOSVersion_7          (DEVICE_OS_VERSION_VALUE >= 7.0  && DEVICE_OS_VERSION_VALUE < 8.0)
#define IOSVersion_8          (DEVICE_OS_VERSION_VALUE >= 8.0  && DEVICE_OS_VERSION_VALUE < 9.0)
#define IOSVersion_9          (DEVICE_OS_VERSION_VALUE >= 9.0  && DEVICE_OS_VERSION_VALUE < 10.0)
#define IOSVersion_10         (DEVICE_OS_VERSION_VALUE >= 10.0 && DEVICE_OS_VERSION_VALUE < 11.0)
#define IOSVersion_11         (DEVICE_OS_VERSION_VALUE >= 11.0 && DEVICE_OS_VERSION_VALUE < 12.0)

//判断系统版本特性代码
//#define __IPHONE_7_0 7000
//#define __IPHONE_10_0 10000

/*###########################################################################################################*/
// app版本号
#define DEVICE_APP_VERSION (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
// app Build版本号
#define DEVICE_APP_BUILD         (NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// 系统版本号（string）
#define DEVICE_OS_VERSION        [[UIDevice currentDevice] systemVersion]
// 系统版本号（float）
#define DEVICE_OS_VERSION_VALUE  [DEVICE_OS_VERSION floatValue]

#endif /* TTCode_h */
