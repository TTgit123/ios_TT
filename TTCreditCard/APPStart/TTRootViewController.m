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
#import "BaseNavigationViewController.h"
//view
#import "LBTabBar.h"


@interface TTRootViewController ()<LBTabBarDelegate>

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
+ (void)initialize
{
    if (@available(iOS 9.0, *)) {
        UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
        
        
        NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
        dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
        dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        
        NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
        dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
        dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        
        [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    } else {
        // Fallback on earlier versions
    }
    
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        [UITabBar appearance].translucent = NO;
//        HomeViewController *homeVC=[[HomeViewController alloc] init];
//        [self setTabBarItem:homeVC title:@"首页" selectedImage:@"home_red" normalImage:@"home_gay" isHiden:NO];
//
//        AccountsViewController *nounVC=[[AccountsViewController alloc] init];
//        [self setTabBarItem:nounVC title:@"账本" selectedImage:@"noun_red" normalImage:@"noun_gay" isHiden:NO];
//
//        ApplyViewController *verbVC=[[ApplyViewController alloc] init];
//        [self setTabBarItem:verbVC title:@"应用" selectedImage:@"verb_red" normalImage:@"verb_gay" isHiden:NO];
//
//        PersonViewController *myVC=[[PersonViewController alloc] init];
//        [self setTabBarItem:myVC title:@"我的" selectedImage:@"my_red" normalImage:@"my_gay" isHiden:NO];
//
//        UINavigationController *homeNV = [[UINavigationController alloc] initWithRootViewController:homeVC];
//        UINavigationController *nounNV = [[UINavigationController alloc] initWithRootViewController:nounVC];
//        UINavigationController *verbNV = [[UINavigationController alloc] initWithRootViewController:verbVC];
//        UINavigationController *myNV = [[UINavigationController alloc] initWithRootViewController:myVC];
//        self.viewControllers = @[homeNV,nounNV,verbNV,myNV];
//        self.selectedIndex = 0;
        HomeViewController *homeVC=[[HomeViewController alloc] init];
        [self setUpOneChildVcWithVc:homeVC Image:@"home_gay" selectedImage:@"home_red" title:@"首页"];
        AccountsViewController *nounVC=[[AccountsViewController alloc] init];
        [self setUpOneChildVcWithVc:nounVC Image:@"noun_gay" selectedImage:@"noun_red" title:@"账本"];
        ApplyViewController *verbVC=[[ApplyViewController alloc] init];
        [self setUpOneChildVcWithVc:verbVC Image:@"verb_gay" selectedImage:@"verb_red" title:@"应用"];
        PersonViewController *myVC=[[PersonViewController alloc] init];
        [self setUpOneChildVcWithVc:myVC Image:@"my_gay" selectedImage:@"my_red" title:@"我的"];
        
        
        //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
        LBTabBar *tabbar = [[LBTabBar alloc] init];
        tabbar.myDelegate = self;
        //kvc实质是修改了系统的_tabBar
        [self setValue:tabbar forKeyPath:@"tabBar"];
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
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:Vc];
    
    
//    Vc.view.backgroundColor = [self randomColor];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(LBTabBar *)tabBar
{
    
    NSLog(@"点击了中间按钮");
    
    
}
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}

@end
