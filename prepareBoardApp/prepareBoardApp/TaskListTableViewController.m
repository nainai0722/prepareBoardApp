//
//  TaskListTableViewController.m
//  prepareBoardApp
//
//  Created by apple on 2018/06/05.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "TaskListTableViewController.h"
#import "TaskListDetailTableViewCell.h"
#import "ViewController.h"

@interface TaskListTableViewController ()

@end

@implementation TaskListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.prepareActionArry = [[NSMutableArray alloc] init];
    // カスタムセルを使用
    UINib *nib = [UINib nibWithNibName:@"TaskListDetailTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"Cell"];
//    NSArray *arr = @[@{@"key":@"着替え"},@{@"key":@"歯磨き"},@{@"key":@"トイレ"}];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return (CGFloat)20.0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 5;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskListDetailTableViewCell" forIndexPath:indexPath];
    
    // カスタムセルを取得
    TaskListDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    NSArray *arr = @[@{@"key":@"着替え"},@{@"key":@"歯磨き"},@{@"key":@"トイレ"},@{@"key":@"朝ごはん"},@{@"key":@"虫除けスプレー"},@{@"key":@"はろくんご飯"},@{@"key":@"荷物準備"},@{@"key":@"靴"},@{@"key":@"帽子"}];
    NSArray *arr = @[@[@{@"key":@"着替え"},@{@"key":@"歯磨き"},@{@"key":@"トイレ"},@{@"key":@"朝ごはん"},@{@"key":@"虫除けスプレー"}],@[@{@"key":@"靴を脱ぐ"},@{@"key":@"手洗い"},@{@"key":@"挨拶"},@{@"key":@"洗濯機に制服投入"},@{@"key":@"ハロ君に夕飯"}],@[@{@"key":@"絵本選ぶ"},@{@"key":@"歯磨き"},@{@"key":@"夜トイレ"},@{@"key":@"連絡帳確認"},@{@"key":@"twitter"}]];
//    NSLog(@"[arr objectAtIndex:] %@",[[arr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]);
//    cell.info = [arr objectAtIndex:indexPath.row];
    cell.HeaderLabel.text =  [[arr objectAtIndex:indexPath.section] objectAtIndex:indexPath.row][@"key"];
    // Configure the cell...
    
    [cell.AddBtn addTarget:self action:@selector(prepareActionAdd:) forControlEvents:UIControlEventTouchUpInside];
    [cell.DeleteBtn addTarget:self action:@selector(prepareActionDelete:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void)prepareActionAdd:(UIButton*)sender{
    
}
- (void)prepareActionDelete:(UIButton*)sender{
    //画面遷移用に使う
        ViewController *vc = [[ViewController alloc] init];
    vc.prepareAction =self.prepareActionArry;
        [self presentViewController:vc animated:YES completion:nil];
    
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    
    // 選択されたセルを取得
//TaskListDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    TaskListDetailTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
//    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"%@", cell.textLabel.text);
    
//    let cell = tableView.cellForRow(at: indexPath)
//    let indicator = cell?.contentView.viewWithTag(1) as! UIActivityIndicatorView
//    indicator.startAnimating()
//    NSLog(@"%@",cell.HeaderLabel.text);
    [self.prepareActionArry addObject:cell.HeaderLabel.text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
