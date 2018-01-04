//
//  BaseViewController.h
//  TKVerb
//
//  Created by 妥妥 on 2017/12/26.
//  Copyright © 2017年 妥妥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UINavigationControllerDelegate>
@property (nonatomic,assign) BOOL isBack;//YES 为显示返回 NO 为不显示
@end
