//
//  DownloadTableViewController.m
//  TTCreditCard
//
//  Created by 妥妥 on 2018/1/5.
//  Copyright © 2018年 妥妥. All rights reserved.
//

#import "DownloadTableViewController.h"
#import "DownLoadCell.h"
#define QSPDownloadTool_DownloadFinishedSources_Path        [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"QSPDownloadTool_DownloadFinishedSources.data"]
@interface DownloadTableViewController ()<QSPDownloadToolDelegate>

@end

@implementation DownloadTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    [[QSPDownloadTool shareInstance] addDownloadToolDelegate:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter
-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];

    }
    return _dataArr;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"DownLoadCell";
    DownLoadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[DownLoadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.source = self.dataArr[indexPath.row];
    
    return cell;
}
- (void)dealloc
{
    NSLog(@"%@ 销毁啦！", NSStringFromClass([self class]));
    [[QSPDownloadTool shareInstance] removeDownloadToolDelegate:self];
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return DownLoadCell_Height;
}
#pragma mark - <QSPDownloadToolDelegate>代理方法
- (void)downloadToolDidFinish:(QSPDownloadTool *)tool downloadSource:(QSPDownloadSource *)source
{
    for (int index = 0; index < self.dataArr.count; index++) {
        QSPDownloadSource *currentSource = self.dataArr[index];
        if (currentSource.task == source.task) {
            [self.dataArr removeObject:currentSource];
            [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationMiddle];
        }
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSArray *arr = [NSArray arrayWithContentsOfFile:QSPDownloadTool_DownloadFinishedSources_Path];
        NSMutableArray *mArr = [NSMutableArray arrayWithArray:arr];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:source];
        [mArr addObject:data];
        
        [mArr writeToFile:QSPDownloadTool_DownloadFinishedSources_Path atomically:YES];
    });
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
