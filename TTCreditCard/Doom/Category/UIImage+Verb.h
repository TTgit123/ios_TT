//
//  UIImage+Verb.h
//  TKVerb
//
//  Created by 妥妥 on 2017/12/27.
//  Copyright © 2017年 妥妥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Verb)
/*
 根据图片倍数修改图片大小
 */
+ (UIImage *) createNewImageWithColor:(UIImage *)image multiple:(CGFloat)multiple;
@end
