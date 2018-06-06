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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isCompBtn = NO;
    self.comp1 = NO;
    self.comp2 = NO;
    self.comp3 = NO;
    self.comp4 = NO;
    self.comp5 = NO;
    self.comp6 = NO;
    self.comp7 = NO;
    self.comp8 = NO;
    self.comp9 = NO;
//@[@[@{@"key":@"着替え"},@{@"key":@"歯磨き"},@{@"key":@"トイレ"},@{@"key":@"朝ごはん"},@{@"key":@"虫除けスプレー"}],@[@{@"key":@"靴を脱ぐ"},@{@"key":@"手洗い"},@{@"key":@"挨拶"},@{@"key":@"洗濯機に制服投入"},@{@"key":@"ハロ君に夕飯"}],@[@{@"key":@"絵本選ぶ"},@{@"key":@"歯磨き"},@{@"key":@"夜トイレ"},@{@"key":@"連絡帳確認"},@{@"key":@"twitter"}]];
    NSMutableDictionary *imageDic =
        @{@"着替え":@"kigaeGirl.png",
          @"歯磨き":@"family_hamigaki_shiage.png",
          @"トイレ":@"toiletKid.png",
          @"朝ごはん":@"food_gohan.png",
          @"虫除けスプレー":@"mushiyoke.png",
          @"靴を脱ぐ":@"kutsu_nugu_good.png",
          @"手洗い":@"tearai_hand_suidou.png",
          @"挨拶":@"ojigi_girl.png",
          @"洗濯機に制服投入":@"sentaku_kago.png",
          @"ハロ君に夕飯":@"pet_oyatsu_dog.png"};
    
    _use = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[self.prepareAction count]; i++) {
        NSString *str =  [self.prepareAction objectAtIndex:i];
        [_use addObject: @{str:imageDic[str] }];
    }
//    NSLog(@"_use %@",_use);
    int countList = 0;
    _remainingTaskNum = (int)[_use count]-1;
    for (UIButton *button in self.aspectBtn) {
        
        if (countList+1 > [self.prepareAction count]) {
            button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        }else{
        NSLog(@"[_use objectAtIndex:countList] %@",[_use objectAtIndex:countList]);
        NSLog(@"self.prepareAction %@",[self.prepareAction objectAtIndex:countList]);
        
        UIImage *img = [UIImage imageNamed:[[_use objectAtIndex:countList] objectForKey:[self.prepareAction objectAtIndex:countList]]];
        [button setImage:img forState:UIControlStateNormal];
            countList++;
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        }
//        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
    }

}
- (IBAction)touchBtn:(UIButton *)sender {
        // 回転させたいUIViewのLayerを取得
        CALayer* layer = sender.layer;
//        NSInteger *btnTag = button.tag;
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
                    self.comp1 = self.comp1?NO:YES;
                    self.isCompBtn = self.comp1;
                    self.comp1?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 1:
                    self.comp2 = self.comp2?NO:YES;
                    self.isCompBtn  = self.comp2;
                    self.comp2?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 2:
                    self.comp3 = self.comp3?NO:YES;
                    NSLog(@"compToilet %@",self.comp3?@"YES":@"NO");
                    self.isCompBtn = self.comp3;
                    self.comp3?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 3:
                    self.comp4 = self.comp4?NO:YES;
                    self.isCompBtn = self.comp4;
                    self.comp4?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 4:
                    self.comp5 = self.comp5?NO:YES;
                    self.isCompBtn = self.comp5;
                    self.comp5?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 5:
                    self.comp6 = self.comp6?NO:YES;
                    self.isCompBtn = self.comp6;
                    self.comp6?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 6:
                    self.comp7 = self.comp7?NO:YES;
                    self.isCompBtn = self.comp7;
                    self.comp7?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 7:
                    self.comp8 = self.comp8?NO:YES;
                    self.isCompBtn = self.comp8;
                    self.comp8?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                case 8:
                    self.comp9 = self.comp9?NO:YES;
                    self.isCompBtn = self.comp9;
                    self.comp9?_remainingTaskNum--:_remainingTaskNum++;
                    break;
                default:
                    break;
            }
            
            if (self.isCompBtn) {
                [sender setImage:[UIImage imageNamed:@"hanko_taihenyokudekimashita.png"] forState:UIControlStateNormal];
            }else{
                switch (sender.tag) {
                    case 0:
                    {
                        [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:0] objectForKey:[self.prepareAction objectAtIndex:0]]] forState:UIControlStateNormal];
                        break;
                    }
                    case 1:
                        [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:1] objectForKey:[self.prepareAction objectAtIndex:1]]] forState:UIControlStateNormal];
                        break;
                    case 2:
                        [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:2] objectForKey:[self.prepareAction objectAtIndex:2]]] forState:UIControlStateNormal];
                        break;
                    case 3:
                        [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:3] objectForKey:[self.prepareAction objectAtIndex:3]]] forState:UIControlStateNormal];
                        break;
                    case 4:
                        [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:4] objectForKey:[self.prepareAction objectAtIndex:4]]] forState:UIControlStateNormal];
                        break;
                    case 5:
                        [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:5] objectForKey:[self.prepareAction objectAtIndex:5]]] forState:UIControlStateNormal];
                        break;
                    case 6:
                        [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:6] objectForKey:[self.prepareAction objectAtIndex:6]]] forState:UIControlStateNormal];
                        break;
                    case 7:
                        [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:7] objectForKey:[self.prepareAction objectAtIndex:7]]] forState:UIControlStateNormal];
                        break;
                    case 8:
                        [sender setImage:[UIImage imageNamed:[[_use objectAtIndex:8] objectForKey:[self.prepareAction objectAtIndex:8]]] forState:UIControlStateNormal];
                        break;
                    default:
                        break;
                }
            }
            
//            }
        } forKey:kCATransactionCompletionBlock];
        
        // コミット→アニメーション開始
        [CATransaction commit];
    
    NSLog(@"_remainingTaskNum  %d",_remainingTaskNum );
    
    if (_remainingTaskNum == 0) {
        for (UIButton *button in self.aspectBtn) {
            button.hidden = YES;
            self.compBtn.hidden = NO;
//            [self reprepareBtn:self.compBtn];
        }
    }
}
//- (IBAction)TouchpetToiletBtn:(UIButton *)sender {
//    // 回転させたいUIViewのLayerを取得
//    CALayer* layer = self.petToiletBtn.layer;
//
//    // トランザクションの開始
//    [CATransaction begin];
//    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
//
//    // Y軸での回転アニメーション
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
//    animation.duration = 0.4;   // 速度(秒数)
//    animation.repeatCount = 1;  // 繰り返す回数
//    animation.fromValue = [NSNumber numberWithFloat:0.0];       // 開始角度
//    animation.toValue = [NSNumber numberWithFloat:2 * M_PI];    // 終了角度（１周）
//
//    // Layerにアニメーションを登録
//    [layer addAnimation:animation forKey:@"rotation-y"];
//
//    //終了時の処理を登録
//    [CATransaction setValue:^{
//        layer.transform = CATransform3DIdentity;//今回の例だと不要(だと思う)ですが、layerの変形を初期状態に戻します
//        [self.petToiletBtn setImage:[UIImage imageNamed:@"hanko_taihenyokudekimashita.png"] forState:UIControlStateNormal];
//    } forKey:kCATransactionCompletionBlock];
//
//    // コミット→アニメーション開始
//    [CATransaction commit];
//}


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
