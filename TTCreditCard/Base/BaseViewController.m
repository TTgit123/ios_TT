//
//  BaseViewController.m
//  TKVerb
//
//  Created by 妥妥 on 2017/12/26.
//  Copyright © 2017年 妥妥. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    self.navigationController.navigationBar.titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.view.backgroundColor = [UIColor RGBcolor:@"#f3f2f0"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setIsBack:(BOOL)isBack
{
    _isBack = isBack;
    if (_isBack) {
        //自定义返回按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 10, 30, 30);
        btn.tag = 10000;
        [btn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *BarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.leftBarButtonItem = BarButtonItem;
        //将返回按钮的文字position设置不在屏幕上显示
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    }
}

#pragma mark -- btnSelect
- (void)cancelClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
