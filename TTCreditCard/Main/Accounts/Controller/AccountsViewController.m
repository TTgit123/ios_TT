//
//  AccountsViewController.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/4.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "AccountsViewController.h"

@interface AccountsViewController ()<JMDropMenuDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * mainTableView;
@end

@implementation AccountsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addView];
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
#pragma mark - AddView
-(void)addView
{
    [self.view addSubview:self.mainTableView];
    [self addViewMas];
}
-(void)addViewMas
{
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
#pragma mark - getter
-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]init];
        [_mainTableView setDelegate:self];
        [_mainTableView setDataSource:self];
        _mainTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _mainTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            // 进入刷新状态后会自动调用这个block
            [_mainTableView.mj_header endRefreshing];

        }];
    }
    return _mainTableView;
}
-(void)siftAction:(UIButton *)sender
{
    NSLog(@"点击了筛选");
    [JMDropMenu showDropMenuFrame:CGRectMake(self.view.frame.size.width - 128, 64, 120, 208) ArrowOffset:102.f TitleArr:@[@"创建群聊",@"加好友/群",@"扫一扫",@"付款",@"拍摄"] ImageArr:@[@"img1",@"img2",@"img3",@"img4",@"img5"] Type:JMDropMenuTypeWeChat LayoutType:JMDropMenuLayoutTypeNormal RowHeight:40.f Delegate:self];
}
- (void)didSelectRowAtIndex:(NSInteger)index Title:(NSString *)title Image:(NSString *)image {
    NSLog(@"index----%zd,  title---%@, image---%@", index, title, image);
}
#pragma mark - tableviewDelegate
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

#pragma mark - tableviewData
//每组个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
//有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//主要方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellName = @"cellName";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.textLabel setText:[NSString stringWithFormat:@"%ld----------行",indexPath.row+1]];
    return cell;
}
@end
