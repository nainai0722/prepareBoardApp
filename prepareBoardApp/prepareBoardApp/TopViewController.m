//
//  TopViewController.m
//  prepareBoardApp
//
//  Created by apple on 2018/06/07.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "TopViewController.h"
#import "TaskListTableViewController.h"
#import "addOriginalTaskViewController.h"
@interface TopViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *collectBtn;

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];  // 取得
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults setObject:@"TEST" forKey:@"taskName"];
    
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    [dictionary setObject:@"kigaeGirl.png" forKey:@"着替え"];
    [dictionary setObject:@"family_hamigaki_shiage.png" forKey:@"歯磨き"];
    [dictionary setObject:@"toiletKid.png" forKey:@"トイレ"];
    [dictionary setObject:@"food_gohan.png" forKey:@"朝ごはん"];
    [dictionary setObject:@"mushiyoke.png" forKey:@"虫除けスプレー"];
    [dictionary setObject:@"kutsu_nugu_good.png" forKey:@"靴を脱ぐ"];
    [dictionary setObject:@"tearai_hand_suidou.png" forKey:@"手洗い"];
    [dictionary setObject:@"ojigi_girl.png" forKey:@"挨拶"];
    [dictionary setObject:@"sentaku_kago.png" forKey:@"洗濯機に制服投入"];
    [dictionary setObject:@"pet_oyatsu_dog.png" forKey:@"ハロ君に夕飯"];
    [dictionary setObject:@"book_renrakuchou.png" forKey:@"連絡帳確認"];
    [dictionary setObject:@"bluebird_baka.png" forKey:@"twitter"];
    [dictionary setObject:@"ehon_hahako.png" forKey:@"絵本選ぶ"];
    [defaults setObject:dictionary forKey:@"imageDic"];
    [ud registerDefaults:defaults];

    
    for (UIButton *button in self.collectBtn) {
            button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
}
- (IBAction)touchBtn:(UIButton *)sender {
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:sender.titleLabel.text forKey:@"taskName"];
    [ud synchronize];
    
    TaskListTableViewController *vc = [[TaskListTableViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)touchAddOriginalTask:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"お支度名追加"
                                                                             message:@"お支度名追加画面へ行きます"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"button title"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                       NSLog(@"clicked Button title: %@", action.title);
                                                       
                                                       //画面遷移用に使う
                                                       addOriginalTaskViewController *vc = [[addOriginalTaskViewController alloc] init];
                                                       [self presentViewController:vc animated:YES completion:nil];
                                                   }];
    [alertController addAction:action];
    [self presentViewController:alertController
                       animated:YES
                     completion:^{
                         NSLog(@"displayed");
                     }];
    
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
