//
//  TaskListDetailTableViewCell.m
//  prepareBoardApp
//
//  Created by apple on 2018/06/05.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//
#import "TaskListDetailTableViewCell.h"

#import "NSAttributedString+img.h"
@interface TaskListDetailTableViewCell()

@end

@implementation TaskListDetailTableViewCell
//@synthesize delegate;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    if (self.prepareActionList == nil) {
        self.prepareActionList = [[NSMutableArray alloc] init];
    }
    isAddAction = NO;
//    NSMutableDictionary *imageDic =
//  @{@"着替え":@"kigaeGirl.png",
//                                      @"歯磨き":@"family_hamigaki_shiage.png",
//                                      @"トイレ":@"toiletKid.png",
//                                      @"朝ごはん":@"food_gohan.png",
//                                      @"虫除けスプレー":@"mushiyoke.png",
//                                      @"靴を脱ぐ":@"kutsu_nugu_good.png",
//                                      @"手洗い":@"tearai_hand_suidou.png",
//                                      @"挨拶":@"ojigi_girl.png",
//                                      @"洗濯機に制服投入":@"sentaku_kago.png",
//                                      @"ハロ君に夕飯":@"pet_oyatsu_dog.png"};
//    NSAttributedString_img *as = [[NSMutableAttributedString alloc] initWithString:self.HeaderLabel.text];
//    
//    UIImage *img;
//    
////    for (int i=0; i<[imageDic count]; i++) {
//        [UIImage imageNamed:[imageDic objectForKey:self.HeaderLabel.text]];
////    }
//    [as insertImage:img bounds:CGRectMake(-2, -10, 40, 40) atIndex:[self.HeaderLabel.text length]];
//    self.HeaderLabel.attributedText = as;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)touchEditactionBtn:(UIButton *)sender {
    NSLog(@"touchEditactionBtn");
    if ([self.delegate respondsToSelector:@selector(editPrepareActionForList:)]) {
        [self.delegate editPrepareActionForList:self];
    }else{
        NSLog(@"delegate失敗");
    }
    
}
- (IBAction)touchAddDeleteActionBtn:(UIButton *)sender {
    BOOL isAdd;
    if ([sender.titleLabel.text isEqualToString:@"Delete"]) {
        [sender setTitle:@"Add" forState:UIControlStateNormal];
        isAdd = NO;//ボタンがAddなので、現状はDelete状態
    }else{
        [sender setTitle:@"Delete" forState:UIControlStateNormal];
        isAdd = YES;//ボタンがDeleteなので、現状はAdd状態
    }
    
    if ([self.delegate respondsToSelector:@selector(addPrepareActionForList::)]) {
        [self.delegate addPrepareActionForList:self:isAdd];
    }else{
            NSLog(@"delegate失敗");
    }
    
    //    [delegate addPrepareActionForList];
}


- (void)setInfo:(NSDictionary *)info{
    info = _info;
//    self.prepareActionList = [NSMutableArray array];
//    NSLog(@"info %@",_info);
//    self.HeaderLabel.text = _info[@"key"];
}
@end
