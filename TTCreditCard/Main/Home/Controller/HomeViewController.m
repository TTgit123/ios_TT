//
//  HomeViewController.m
//  TKVerb
//
//  Created by 妥妥 on 2017/12/26.
//  Copyright © 2017年 妥妥. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AddView
-(void)addView
{

    [self addViewMas];
}
-(void)addViewMas
{

}
#pragma mark - ViewCycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
@end
