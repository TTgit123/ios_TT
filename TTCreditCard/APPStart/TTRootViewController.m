//
//  TTRootViewController.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/4.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "TTRootViewController.h"
#import "HomeViewController.h"
#import "AccountsViewController.h"
#import "ApplyViewController.h"
#import "PersonViewController.h"

@interface TTRootViewController ()

@end

@implementation TTRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        [UITabBar appearance].translucent = NO;
        HomeViewController *homeVC=[[HomeViewController alloc] init];
        [self setTabBarItem:homeVC title:@"首页" selectedImage:@"home_red" normalImage:@"home_gay" isHiden:NO];
        
        AccountsViewController *nounVC=[[AccountsViewController alloc] init];
        [self setTabBarItem:nounVC title:@"账本" selectedImage:@"noun_red" normalImage:@"noun_gay" isHiden:NO];
        
        ApplyViewController *verbVC=[[ApplyViewController alloc] init];
        [self setTabBarItem:verbVC title:@"应用" selectedImage:@"verb_red" normalImage:@"verb_gay" isHiden:NO];
        
        PersonViewController *myVC=[[PersonViewController alloc] init];
        [self setTabBarItem:myVC title:@"我的" selectedImage:@"my_red" normalImage:@"my_gay" isHiden:NO];
        
        UINavigationController *homeNV = [[UINavigationController alloc] initWithRootViewController:homeVC];
        UINavigationController *nounNV = [[UINavigationController alloc] initWithRootViewController:nounVC];
        UINavigationController *verbNV = [[UINavigationController alloc] initWithRootViewController:verbVC];
        UINavigationController *myNV = [[UINavigationController alloc] initWithRootViewController:myVC];
        self.viewControllers = @[homeNV,nounNV,verbNV,myNV];
    }
    return self;
}
- (void)setTabBarItem:(UIViewController *)VC title:(NSString *)title selectedImage:(NSString *)selectedImage normalImage:(NSString *)normalImage isHiden:(BOOL)hiden
{
    //设置图片
    UITabBarItem * tabbarItem = VC.tabBarItem;
    tabbarItem = [tabbarItem initWithTitle:title image:[[UIImage imageNamed:normalImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // S未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont fontWithName:@"HeiTi SC" size:13.0f]} forState:UIControlStateNormal];
    
    // 选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont fontWithName:@"HeiTi SC" size:13.0f]} forState:UIControlStateSelected];
    VC.title = title;
}

@end
