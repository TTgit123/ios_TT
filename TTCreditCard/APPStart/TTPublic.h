//
//  TTPublic.h
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/6.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#ifndef TTPublic_h
#define TTPublic_h

//服务器地址
//#define URLHEAD @"http://192.168.1.179:8080/"//LWQ
#define URLHEAD @"http://192.168.1.151:8080/"//YTH
//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG

//#define NSLog(format, ...) do {                                             \
//fprintf(stderr, "%s ：%d行\n%s\n",                                           \
//[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
//__LINE__, __func__);                                                        \
//(NSLog)((format), ##__VA_ARGS__);                                           \
//fprintf(stderr, "-------\n");                                               \
//} while (0)
#define NSLog(FORMAT, ...) {\
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];\
[dateFormatter setDateStyle:NSDateFormatterMediumStyle];\
[dateFormatter setTimeStyle:NSDateFormatterShortStyle];\
[dateFormatter setDateFormat:@"HH:mm:ss"]; \
NSString *str = [dateFormatter stringFromDate:[NSDate date]];\
fprintf(stderr,"时间 : %s\n类名 : <%s> : %d行\n方法名 : %s\n/*\n%s\n*/\n-----------\n",[str UTF8String],[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__,__func__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);\
}

#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)

#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)

#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)

#else
#define NSLog(FORMAT, ...) nil

#define NSLogRect(rect) nil

#define NSLogSize(size) nil

#define NSLogPoint(point) nil

#endif

//工程文件路径
#define MainBundleFile(fileName) [[NSBundle mainBundle] pathForResource:fileName ofType:nil]
//沙盒Document文件夹路径 没有可不传
#define DocumentFileComponent(fileComponent) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileComponent]

#endif /* TTPublic_h */
