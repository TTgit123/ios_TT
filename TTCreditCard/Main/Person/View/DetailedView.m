//
//  DetailedView.m
//  TKVerb
//
//  Created by 妥妥 on 2017/12/28.
//  Copyright © 2017年 妥妥. All rights reserved.
//

#import "DetailedView.h"

@implementation DetailedView
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self addView];
    }
    return self;
}
#pragma mark AddView
-(void)addView
{
    [self addSubview:self.backImageView];
    [self addSubview:self.headImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.worthTitle];
    [self addSubview:self.worthLabel];
    [self addSubview:self.nworthTitle];
    [self addSubview:self.nworthLabel];
    [self addViewMas];
}
-(void)addViewMas
{
    [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.mas_offset(50);
        make.height.mas_offset(50);
        make.top.mas_offset(20);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.equalTo(self);
        make.height.mas_offset(20);
        make.top.mas_equalTo(_headImageView.mas_bottom).offset(5);
    }];
    [_worthTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(_nworthTitle.mas_left).offset(-10);
        make.top.mas_equalTo(_nameLabel.mas_bottom).offset(5);
        make.height.offset(20);
        make.width.equalTo(_nworthTitle);
    }];
    [_nworthTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_worthTitle.mas_right).offset(10);
        make.top.mas_equalTo(_nameLabel.mas_bottom).offset(5);
        make.right.equalTo(self);
        make.height.offset(20);
        make.width.equalTo(_worthTitle);
    }];
    [_worthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(_nworthLabel.mas_left).offset(-10);
        make.top.mas_equalTo(_worthTitle.mas_bottom).offset(0);
        make.height.offset(20);
        make.width.equalTo(_nworthLabel);
    }];
    [_nworthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_worthLabel.mas_right).offset(10);
        make.right.equalTo(self);
        make.top.mas_equalTo(_nworthTitle.mas_bottom).offset(0);
        make.height.offset(20);
        make.width.equalTo(_worthLabel);
    }];


}
#pragma mark - getter
-(UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc]init];
//        [_backImageView setBackgroundColor:[UIColor RGBcolor:@"#1296db"]];
        [_backImageView setImage:[UIImage imageNamed:@"apic3734"]];
    }
    return _backImageView;
}
-(UIImageView *)headImageView
{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.layer.masksToBounds = YES;
        _headImageView.layer.cornerRadius = 25;
        [_headImageView setImage:[UIImage imageNamed:@"personal-center"]];
        [_headImageView setUserInteractionEnabled:YES];
        UITapGestureRecognizer * tapG = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headTapAction:)];
        [_headImageView addGestureRecognizer:tapG];
    }
    return _headImageView;
}
-(UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        [_nameLabel setText:@"136****1392"];
        [_nameLabel setFont:[UIFont systemFontOfSize:12.0f]];
        [_nameLabel setTextAlignment:NSTextAlignmentCenter];
        [_nameLabel setTextColor:[UIColor whiteColor]];
    }
    return _nameLabel;
}
-(UILabel *)worthTitle
{
    if (!_worthTitle) {
        _worthTitle = [[UILabel alloc]init];
        [_worthTitle setText:@"可用余额"];
        [_worthTitle setFont:[UIFont systemFontOfSize:14.0f]];
        [_worthTitle setTextAlignment:NSTextAlignmentCenter];
        [_worthTitle setTextColor:[UIColor whiteColor]];
    }
    return _worthTitle;
}
-(UILabel *)worthLabel
{
    if (!_worthLabel) {
        _worthLabel = [[UILabel alloc]init];
        [_worthLabel setText:@"¥0.00"];
        [_worthLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_worthLabel setTextAlignment:NSTextAlignmentCenter];
        [_worthLabel setTextColor:[UIColor whiteColor]];
    }
    return _worthLabel;
}
-(UILabel *)nworthTitle
{
    if (!_nworthTitle) {
        _nworthTitle = [[UILabel alloc]init];
        [_nworthTitle setText:@"冻结余额"];
        [_nworthTitle setFont:[UIFont systemFontOfSize:14.0f]];
        [_nworthTitle setTextAlignment:NSTextAlignmentCenter];
        [_nworthTitle setTextColor:[UIColor whiteColor]];
    }
    return _nworthTitle;
}
-(UILabel *)nworthLabel
{
    if (!_nworthLabel) {
        _nworthLabel = [[UILabel alloc]init];
        [_nworthLabel setText:@"❄0.00"];
        [_nworthLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_nworthLabel setTextAlignment:NSTextAlignmentCenter];
        [_nworthLabel setTextColor:[UIColor whiteColor]];
    }
    return _nworthLabel;
}
#pragma mark - GestureRecognizer
-(void)headTapAction:(UITapGestureRecognizer *)sender
{
    [_tkDelegate tapHeadView];
}
@end
