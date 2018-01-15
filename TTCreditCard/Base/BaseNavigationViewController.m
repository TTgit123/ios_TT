//
//  BaseNavigationViewController.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/6.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "BaseNavigationViewController.h"
//黄色导航栏
#define NavBarColor [UIColor colorWithRed:250/255.0 green:227/255.0 blue:111/255.0 alpha:1.0]
@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor RGBcolor:@"#f3f2f0"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
+ (void)load
{
    
    
    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedIn:self, nil ];
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    dic[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    dic[NSForegroundColorAttributeName]=[UIColor blackColor];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    if (@available(iOS 9.0, *)) {
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
        
        [bar setBackgroundImage:[UIImage imageWithColor:NavBarColor] forBarMetrics:UIBarMetricsDefault];
        NSMutableDictionary *dicBar=[NSMutableDictionary dictionary];
        
        dicBar[NSFontAttributeName]=[UIFont systemFontOfSize:15];
        [bar setTitleTextAttributes:dic];
    } else {
        // Fallback on earlier versions
    }
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    // 修改tabBra的frame

    CGRect frame = self.tabBarController.tabBar.frame;

    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;

    self.tabBarController.tabBar.frame = frame;

    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    return [super pushViewController:viewController animated:animated];
    
}

@end
