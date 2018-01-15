//
//  HomeViewController.m
//  TKVerb
//
//  Created by 妥妥 on 2017/12/26.
//  Copyright © 2017年 妥妥. All rights reserved.
//

#import "HomeViewController.h"
//view
#import "SDCycleScrollView.h"


@interface HomeViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView * verbView;//广告轮播
@property (nonatomic,assign) BOOL canceled;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addView];
    [self addData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)doSomeWorkWithProgress {

//    MBProgressHUD * hud = [YJProgressHUD showProgressCircle:@"login..." inView:self.view];
//    [[TTDataService sharedManager] downloadFileWithUrl:@"http://120.25.226.186:32812/resources/videos/minion_08.mp4" WithDownloadBlock:^(CGFloat downloadFloat) {
//        if (hud) {
//            hud.progress = downloadFloat;
//        }
//    } WithSuccessBlock:^(id result) {
//        [hud hideAnimated:YES];
//    } WithFailurBlock:^(NSString *error) {
//
//    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self doSomeWorkWithProgress];

}
#pragma mark - AddView
-(void)addView
{
    

    [self.view addSubview:self.verbView];
    [self addViewMas];
}
-(void)addViewMas
{
    [_verbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(KStatusBarHeight);
        make.left.offset(0);
        make.right.offset(0);
        make.height.offset(200);
    }];
}
#pragma mark - AddData
-(void)addData
{
    [[TTDataService sharedManager] requestWithMethod:GET WithPath:@"getImages" WithParams:nil WithSuccessBlock:^(id result) {
        NSMutableArray * imgArray = [NSMutableArray array];
        for (id obj in result) {
            [imgArray addObject:obj[@"url"]];
        }
        if (imgArray.count>0) {
            _verbView.imageURLStringsGroup = imgArray;
        }
        
    } WithFailurBlock:^(NSString *error) {
        [YJProgressHUD showMessage:error inView:self.view];
    }];
}
#pragma mark - getter
-(SDCycleScrollView *)verbView
{
    //本地图片轮播
    _verbView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageNamesGroup:nil];
    _verbView.delegate = self;
    _verbView.autoScrollTimeInterval = 5.0f;
    _verbView.placeholderImage = [UIImage imageNamed:@"apic3734"];
    return _verbView;
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
