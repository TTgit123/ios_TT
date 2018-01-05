//
//  OutTableViewController.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/5.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "OutTableViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#define QSPDownloadTool_DownloadFinishedSources_Path        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"QSPDownloadTool_DownloadFinishedSources.data"]
@interface OutTableViewController ()<QSPDownloadToolDelegate>

@end

@implementation OutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [[QSPDownloadTool shareInstance] addDownloadToolDelegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray arrayWithCapacity:1];
        NSArray *arr = [NSArray arrayWithContentsOfFile:QSPDownloadTool_DownloadFinishedSources_Path];
        
        for (NSData *data in arr) {
            QSPDownloadSource *source = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [_dataArr addObject:source];
        }
    }
    
    return _dataArr;
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"DownLoadCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    QSPDownloadSource *source = self.dataArr[indexPath.row];
    cell.textLabel.text = source.fileName;
    cell.detailTextLabel.text = [QSPDownloadTool calculationDataWithBytes:source.totalBytesExpectedToWrite];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    QSPDownloadSource *source = self.dataArr[indexPath.row];
    NSLog(@"%@", source.location);
    MPMoviePlayerViewController *ctr = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:source.location]];
    [self presentViewController:ctr animated:YES completion:nil];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[QSPDownloadTool shareInstance] stopDownload:self.dataArr[indexPath.row]];
        [self.dataArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:1];
            for (QSPDownloadSource *source in self.dataArr) {
                NSData *data = [NSKeyedArchiver archivedDataWithRootObject:source];
                [mArr addObject:data];
            }
            [mArr writeToFile:QSPDownloadTool_DownloadFinishedSources_Path atomically:YES];
        });
    }
}

#pragma mark - <QSPDownloadToolDelegate>代理方法
- (void)downloadToolDidFinish:(QSPDownloadTool *)tool downloadSource:(QSPDownloadSource *)source
{
    [self.dataArr addObject:source];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.dataArr.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationMiddle];
}
- (void)dealloc
{
    NSLog(@"%@ 销毁啦！", NSStringFromClass([self class]));
    [[QSPDownloadTool shareInstance] removeDownloadToolDelegate:self];
}
@end
