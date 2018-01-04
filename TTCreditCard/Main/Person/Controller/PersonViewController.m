//
//  PersonViewController.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/4.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

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
        
    }
    return self;
}
#pragma mark - AddView
-(void)addView
{
    
}
-(void)addViewMas
{
    
}
#pragma mark - getter
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
