//
//  SegmentSampleViewController.m
//  XHSegmentControllerSample
//
//  Created by xihe on 16/4/19.
//  Copyright © 2016年 xihe. All rights reserved.
//

#import "SegmentSampleViewController.h"

@interface SegmentSampleViewController ()

@end

@implementation SegmentSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.downloadTableViewVC.title = @"正在下载";
    
    self.outTableViewVC.title = @"已完成";
    
    self.viewControllers = @[self.downloadTableViewVC, self.outTableViewVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - getter
-(DownloadTableViewController *)downloadTableViewVC
{
    if (!_downloadTableViewVC) {
        _downloadTableViewVC = [[DownloadTableViewController alloc]init];
    }
    return _downloadTableViewVC;
}
-(OutTableViewController *)outTableViewVC
{
    if (!_outTableViewVC) {
        _outTableViewVC = [[OutTableViewController alloc]init];
    }
    return _outTableViewVC;
}
@end
