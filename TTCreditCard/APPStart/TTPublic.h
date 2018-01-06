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
#define URLHEAD @"http://www.yth996.com:8080/"

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG

#define NSLog(format, ...) do {                                             \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)
#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)
#else
#define NSLog(FORMAT, ...) nil
#define NSLogRect(rect) nil
#define NSLogSize(size) nil
#define NSLogPoint(point) nil
#endif



#endif /* TTPublic_h */
