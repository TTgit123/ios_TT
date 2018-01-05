//
//  DetailedView.h
//  TKVerb
//
//  Created by 妥妥 on 2017/12/28.
//  Copyright © 2017年 妥妥. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailedViewDelegate <NSObject>

- (void)tapHeadView;

@end

@interface DetailedView : UIView


@property (nonatomic,strong) UIImageView * backImageView;//背景
@property (nonatomic,strong) UIImageView * headImageView;//用户头像
@property (nonatomic,strong) UILabel * nameLabel;//用户名称
@property (nonatomic,strong) UILabel * worthTitle;//可用余额标题
@property (nonatomic,strong) UILabel * worthLabel;//可用余额
@property (nonatomic,strong) UILabel * nworthTitle;//不可用余额标题
@property (nonatomic,strong) UILabel * nworthLabel;//不可用余额

@property (nonatomic,strong) id<DetailedViewDelegate>tkDelegate;
@end
