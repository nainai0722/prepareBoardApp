//
//  ViewController.m
//  prepareBoardApp
//
//  Created by apple on 2018/06/02.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "ViewController.h"
#import "TopViewController.h"
@interface ViewController (){
    int _remainingTaskNum; //インスタンス変数
    NSMutableArray *_use;
}
@property (weak, nonatomic) IBOutlet UIButton *petToiletBtn;
@property (weak, nonatomic) IBOutlet UIButton *kigae;
@property (weak, nonatomic) IBOutlet UIButton *toilet;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *aspectBtn;
- (IBAction)touchBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *compBtn;
@property( nonatomic) BOOL isCompBtn;
@property( nonatomic)BOOL comp0;
@property( nonatomic)BOOL comp1;
@property( nonatomic)BOOL comp2;
@property( nonatomic)BOOL comp3;
@property( nonatomic)BOOL comp4;
@property( nonatomic)BOOL comp5;
@property( nonatomic)BOOL comp6;
@property( nonatomic)BOOL comp7;
@property( nonatomic)BOOL comp8;
@property( nonatomic)BOOL comp9;
@property (weak, nonatomic) IBOutlet UILabel *TaskName;
@property (weak, nonatomic) IBOutlet UIButton *allActionCompBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *str = [ud stringForKey:@"taskName"];
    self.TaskName.text = str;
    
    self.allActionCompBtn.hidden = YES;
    
    self.isCompBtn = NO;
    self.comp0 = NO;
    self.comp1 = NO;
    self.comp2 = NO;
    self.comp3 = NO;
    self.comp4 = NO;
    self.comp5 = NO;
    self.comp6 = NO;
    self.comp7 = NO;
    self.comp8 = NO;
//    NSMutableDictionary *imageDic =
//        @{@"着替え":@"kigaeGirl.png",
//          @"歯磨き":@"family_hamigaki_shiage.png",
//          @"トイレ":@"toiletKid.png",
//          @"朝ごはん":@"food_gohan.png",
//          @"虫除けスプレー":@"mushiyoke.png",
//          @"靴を脱ぐ":@"kutsu_nugu_good.png",
//          @"手洗い":@"tearai_hand_suidou.png",
//          @"挨拶":@"ojigi_girl.png",
//          @"洗濯機に制服投入":@"sentaku_kago.png",
//          @"ハロ君に夕飯":@"pet_oyatsu_dog.png",
//          @"連絡帳確認":@"book_renrakuchou.png",
//          @"twitter":@"bluebird_baka.png",
//          @"絵本選ぶ":@"ehon_hahako.png"
//          };

    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary* imageDic = [defaults dictionaryForKey:@"imageDic"];
    
    _use = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[self.prepareAction count]; i++) {
        NSString *str =  [self.prepareAction objectAtIndex:i];
        if([imageDic objectForKey:str] != nil){
            [_use addObject: @{str:imageDic[str]}];
        }else{
            [_use addObject: @{str:[NSString stringWithFormat:@"%@/originalTaskImage.png" , [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]]}];
        }
    }
    int countList = 0;
    _remainingTaskNum = (int)[_use count]-1;
    for (UIButton *button in self.aspectBtn) {
        
        if (countList+1 > [self.prepareAction count]) {
            button.hidden= YES;
        }else{
//        存在しない画像であれば、ローカルから取得してくる。
            
        NSString *imgName = [[_use objectAtIndex:countList] objectForKey:[self.prepareAction objectAtIndex:countList]];
            UIImage *img;
            if (imgName == nil) {
                NSString *filePath = [NSString stringWithFormat:@"%@/originalTaskImage.png" , [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
                img = [UIImage imageNamed:filePath];
            }else{
                img = [UIImage imageNamed:imgName];
            }
        [button setImage:img forState:UIControlStateNormal];
            countList++;
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        }
        
    }

}
- (IBAction)touchBtn:(UIButton *)sender {
        // 回転させたいUIViewのLayerを取得
        CALayer* layer = sender.layer;
        // トランザクションの開始
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
        
        // Y軸での回転アニメーション
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        animation.duration = 0.4;   // 速度(秒数)
        animation.repeatCount = 1;  // 繰り返す回数
        animation.fromValue = [NSNumber numberWithFloat:0.0];       // 開始角度
        animation.toValue = [NSNumber numberWithFloat:2 * M_PI];    // 終了角度（１周）
        
        // Layerにアニメーションを登録
        [layer addAnimation:animation forKey:@"rotation-y"];
        
        //終了時の処理を登録
        [CATransaction setValue:^{
            layer.transform = CATransform3DIdentity;
            switch (sender.tag) {

                case 0:
                    self.comp0 = self.comp0?NO:YES;
                    self.isCompBtn = self.comp0;
                    self.comp0?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 1:
                    self.comp1 = self.comp1?NO:YES;
                    self.isCompBtn  = self.comp1;
                    self.comp1?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 2:
                    self.comp2 = self.comp2?NO:YES;
                    self.isCompBtn  = self.comp2;
                    self.comp2?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 3:
                    self.comp3 = self.comp3?NO:YES;
                    NSLog(@"compToilet %@",self.comp3?@"YES":@"NO");
                    self.isCompBtn = self.comp3;
                    self.comp3?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 4:
                    self.comp4 = self.comp4?NO:YES;
                    self.isCompBtn = self.comp4;
                    self.comp4?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 5:
                    self.comp5 = self.comp5?NO:YES;
                    self.isCompBtn = self.comp5;
                    self.comp5?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 6:
                    self.comp6 = self.comp6?NO:YES;
                    self.isCompBtn = self.comp6;
                    self.comp6?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 7:
                    self.comp7 = self.comp7?NO:YES;
                    self.isCompBtn = self.comp7;
                    self.comp7?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 8:
                    self.comp8 = self.comp8?NO:YES;
                    self.isCompBtn = self.comp8;
                    self.comp8?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                default:
                    break;
            }

            if (self.isCompBtn) {
                [sender setImage:[UIImage imageNamed:@"hanko_taihenyokudekimashita.png"] forState:UIControlStateNormal];
            }else{
               [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:sender.tag] objectForKey:[self.prepareAction objectAtIndex:sender.tag]]] forState:UIControlStateNormal];
            }
            
//            }
        } forKey:kCATransactionCompletionBlock];
        
        // コミット→アニメーション開始
        [CATransaction commit];
    
    NSLog(@"_remainingTaskNum  %d",_remainingTaskNum );
    
    if (_remainingTaskNum == 0) {
//        for (UIButton *button in self.aspectBtn) {
//            button.hidden = YES;
//            self.compBtn.hidden = NO;
//        }
        self.allActionCompBtn.hidden = NO;
    }
}
- (IBAction)touchAllActionCompBtn:(UIButton *)sender {
    for (UIButton *button in self.aspectBtn) {
                button.hidden = YES;
                self.compBtn.hidden = NO;
        sender.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reprepareBtn:(UIButton *)sender {
    //画面遷移用に使う
    TopViewController *vc = [[TopViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    NSLog(@"repreprebtn");
}

@end
