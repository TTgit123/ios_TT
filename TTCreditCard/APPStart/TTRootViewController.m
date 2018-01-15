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
//model
#import "TTHomeModel.h"

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
        HomeViewController *homeVC=[[HomeViewController alloc] init];
        [self setUpOneChildVcWithVc:homeVC Image:@"home_gay" selectedImage:@"home_red" title:@"首页"];
        AccountsViewController *nounVC=[[AccountsViewController alloc] init];
        [self setUpOneChildVcWithVc:nounVC Image:@"noun_gay" selectedImage:@"noun_red" title:@"账本"];
        ApplyViewController *verbVC=[[ApplyViewController alloc] init];
        [self setUpOneChildVcWithVc:verbVC Image:@"verb_gay" selectedImage:@"verb_red" title:@"应用"];
        PersonViewController *myVC=[[PersonViewController alloc] init];
        [self setUpOneChildVcWithVc:myVC Image:@"my_gay" selectedImage:@"my_red" title:@"我的"];

//
//        //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
//        LBTabBar *tabbar = [[LBTabBar alloc] init];
//        tabbar.myDelegate = self;
//        //kvc实质是修改了系统的_tabBar
//        [self setValue:tabbar forKeyPath:@"tabBar"];
    }
    return self;
}

- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    BaseNavigationViewController *nav = [[BaseNavigationViewController alloc] initWithRootViewController:Vc];

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
-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    if (iPhoneX) {
        
        CGRect frame = self.tabBar.frame;
        frame.size.height = TabbarHeight;
        frame.origin.y = self.view.frame.size.height - frame.size.height;
        self.tabBar.frame = frame;
        for (UITabBarItem *item in self.tabBar.items) {
            item.imageInsets = UIEdgeInsetsMake(0,0, -15, 0);
            [item setTitlePositionAdjustment:UIOffsetMake(0, 10)];
        }

    }
    NSLog(@"tabbar.height2 == %lf",self.tabBar.frame.size.height);
}

-(BOOL)prefersHomeIndicatorAutoHidden{
    return YES;
}
@end
