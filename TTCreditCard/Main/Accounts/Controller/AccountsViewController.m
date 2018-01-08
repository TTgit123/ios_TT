//
//  AccountsViewController.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/4.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "AccountsViewController.h"

@interface AccountsViewController ()<JMDropMenuDelegate>

@end

@implementation AccountsViewController

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
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 54, 30);
        [btn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [btn setTitle:@"筛选" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(siftAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *siftBarItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        self.navigationItem.rightBarButtonItem = siftBarItem;
    }
    return self;
}
-(void)siftAction:(UIButton *)sender
{
    NSLog(@"点击了筛选");
    [JMDropMenu showDropMenuFrame:CGRectMake(self.view.frame.size.width - 128, 64, 120, 208) ArrowOffset:102.f TitleArr:@[@"创建群聊",@"加好友/群",@"扫一扫",@"付款",@"拍摄"] ImageArr:@[@"img1",@"img2",@"img3",@"img4",@"img5"] Type:JMDropMenuTypeWeChat LayoutType:JMDropMenuLayoutTypeNormal RowHeight:40.f Delegate:self];
}
- (void)didSelectRowAtIndex:(NSInteger)index Title:(NSString *)title Image:(NSString *)image {
    NSLog(@"index----%zd,  title---%@, image---%@", index, title, image);
}
@end
