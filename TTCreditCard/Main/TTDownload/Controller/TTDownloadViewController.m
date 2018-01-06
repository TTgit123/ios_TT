//
//  TTDownloadViewController.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/5.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "TTDownloadViewController.h"
#import "SegmentSampleViewController.h"

@interface TTDownloadViewController ()
@property (nonatomic,strong) SegmentSampleViewController * segmentSamp;
@end

@implementation TTDownloadViewController

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
        self.title = @"下载中心";
        self.isBack = YES;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [button addTarget:self action:@selector(addDownLoadData:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
        [self.navigationItem setRightBarButtonItem:item];
    }
    return self;
}
- (void)addDownLoadData:(UIButton *)sender
{
    [_segmentSamp.downloadTableViewVC.dataArr addObject:[[QSPDownloadTool shareInstance] addDownloadTast:@"http://120.25.226.186:32812/resources/videos/minion_08.mp4" andOffLine:YES]];//http://zyvideo1.oss-cn-qingdao.aliyuncs.com/zyvd/7c/de/04ec95f4fd42d9d01f63b9683ad0   //http://dl102.80s.im:920/1703/[射雕YX传2017版]第38集/[射雕YX传2017版]第38集_bd.mp4
    [_segmentSamp.downloadTableViewVC.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:_segmentSamp.downloadTableViewVC.dataArr.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
}
#pragma mark - AddView
-(void)addView
{
    [self.view addSubview:self.segmentSamp.view];
    [self addViewMas];
}
-(void)addViewMas
{

    [_segmentSamp.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(-64);
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
    }];
}
#pragma mark - getter

-(SegmentSampleViewController *)segmentSamp
{
    if (!_segmentSamp) {
        _segmentSamp = [[SegmentSampleViewController alloc]init];

        [self addChildViewController:_segmentSamp];
    }
    return _segmentSamp;
}
@end
