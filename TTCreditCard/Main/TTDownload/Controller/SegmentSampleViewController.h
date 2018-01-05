//
//  SegmentSampleViewController.h
//  XHSegmentControllerSample
//
//  Created by xihe on 16/4/19.
//  Copyright © 2016年 xihe. All rights reserved.
//

#import <UIKit/UIKit.h>
//控制器
#import "XHSegmentViewController.h"
#import "DownloadTableViewController.h"
#import "OutTableViewController.h"
@interface SegmentSampleViewController : XHSegmentViewController
@property (nonatomic,strong) DownloadTableViewController * downloadTableViewVC;
@property (nonatomic,strong) OutTableViewController * outTableViewVC;
@end
