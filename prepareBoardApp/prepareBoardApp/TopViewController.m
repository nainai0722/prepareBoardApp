//
//  TopViewController.m
//  prepareBoardApp
//
//  Created by apple on 2018/06/07.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "TopViewController.h"
#import "TaskListTableViewController.h"
@interface TopViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *collectBtn;

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    for (UIButton *button in self.collectBtn) {
            button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
}
- (IBAction)touchBtn:(UIButton *)sender {
    //画面遷移用に使う
    TaskListTableViewController *vc = [[TaskListTableViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*
 //画面遷移用に使う
 ViewController *vc = [[ViewController alloc] init];
 vc.prepareAction =self.prepareActionArry;
 [self presentViewController:vc animated:YES completion:nil];
 */
@end
