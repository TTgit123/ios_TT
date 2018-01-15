//
//  PersonViewController.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/4.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "PersonViewController.h"
//控制器
#import "TTDownloadViewController.h"
#import "MMScanViewController.h"


//视图
#import "DetailedView.h"

#define TARRAY @[@[@"修改密码",@"基本资料",@"实名认证"],@[@"提现申请",@"充值"],@[@"公告通知",@"帮助中心",@"版本信息",@"全国客服电话：4009925722"],@[@"安全退出"]]
@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource,DetailedViewDelegate>
@property (nonatomic,strong) DetailedView * detailedView;

@property (nonatomic,strong) UITableView * mainTableView;


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
        [self addView];
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
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
}
#pragma mark - getter
-(DetailedView *)detailedView
{
    if (!_detailedView) {
        _detailedView = [[DetailedView alloc]init];
        [_detailedView setTkDelegate:self];
    }
    return _detailedView;
}
-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_mainTableView setDelegate:self];
        [_mainTableView setDataSource:self];
        _mainTableView.bounces = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.showsVerticalScrollIndicator = NO;
        // 隐藏UITableViewStyleGrouped上边多余的间隔
        _mainTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    }
    return _mainTableView;
}
#pragma mark - tableviewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 160;
    }
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWight, 160)];
        [headerView addSubview:self.detailedView];
        [_detailedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(headerView);
            make.bottom.equalTo(headerView);
            make.left.equalTo(headerView);
            make.right.equalTo(headerView);
        }];

        return headerView;
    }
    return nil;
}

#pragma mark - tableviewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * rowArr = TARRAY[section];
    return rowArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return TARRAY.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellName = @"cellName";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray * rowArr = TARRAY[indexPath.section];
    cell.textLabel.text = rowArr[indexPath.row];
    [cell.textLabel setFont:[UIFont systemFontOfSize:14.0f]];
    if (indexPath.section==TARRAY.count-1) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;//文字居中
        [cell.textLabel setTextColor:[UIColor redColor]];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:{
            if (indexPath.row == 0) {

            }
            else if (indexPath.row == 1)
            {

            }
            else
            {

            }
        }
            break;
        case 1:{
            if (indexPath.row == 0) {
                MMScanViewController *scanVc = [[MMScanViewController alloc] initWithQrType:MMScanTypeAll onFinish:^(NSString *result, NSError *error) {
                    if (error) {
                        NSLog(@"error: %@",error);
                    } else {
                        NSLog(@"扫描结果：%@",result);
                        [YJProgressHUD showMessage:result inView:self.view];
                        
                        
                    }
                }];
                [self.navigationController pushViewController:scanVc animated:YES];
            }
            else
            {
                WYWebController *webVC = [WYWebController new];
                webVC.url = @"https://www.baidu.com";
                [self.navigationController pushViewController:webVC animated:YES];
            }
        }
            break;
        case 2:{
            if (indexPath.row == 0) {
                //公告通知
                [YJProgressHUD showMessage:@"公告通知" inView:self.view];
                

            }
            else if (indexPath.row == 1)
            {
                //帮助中心
//                [YJProgressHUD showMessage:@"帮助中心" inView:self.view];
                TTDownloadViewController * downVC = [[TTDownloadViewController alloc]init];
                [downVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:downVC animated:YES];
            }
            else if (indexPath.row == 2)
            {

            }
            else
            {
                //客服电话
                NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"4009925722"];
                UIWebView *callWebview = [[UIWebView alloc] init];
                [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
                [self.view addSubview:callWebview];
            }
        }
            break;
        case 3:{
            [LEEAlert alert].config
            .LeeTitle(@"提示")
            .LeeContent(@"确认退出登录？")
            .LeeAction(@"确认", ^{
                [YJProgressHUD showMessage:@"敬请期待" inView:self.view];
                // 确认点击事件Block
            })
            .LeeCancelAction(@"取消", ^{
                
                // 取消点击事件Block
            })
            .LeeShow(); // 设置完成后 别忘记调用Show来显示
        }
            break;
        default:
            break;
    }
}
#pragma mark - TTDelegate
-(void)tapHeadView
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
