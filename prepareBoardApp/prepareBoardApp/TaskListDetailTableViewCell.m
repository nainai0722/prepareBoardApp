//
//  TaskListDetailTableViewCell.m
//  prepareBoardApp
//
//  Created by apple on 2018/06/05.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "TaskListDetailTableViewCell.h"

@implementation TaskListDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    if (self.prepareActionList == nil) {
        self.prepareActionList = [[NSMutableArray alloc] init];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)prepareActionAddbtn:(UIButton *)sender {
//    if (self.prepareActionList == nil) {
//        self.prepareActionList = [NSMutableArray array];
//    }

    [self.prepareActionList addObject:[NSString stringWithFormat:@"%@",self.HeaderLabel.text]];
    
    NSLog(@"self.prepareActionList %@",self.prepareActionList);
//    self.addNum++;
}
- (IBAction)prepareActionDeleteBtn:(UIButton *)sender {
//    ViewController *vc = [[ViewController alloc] init];
//    [self presentViewController:vc animated:YES completion:nil];
    
}

- (void)setInfo:(NSDictionary *)info{
    info = _info;
//    self.prepareActionList = [NSMutableArray array];
//    NSLog(@"info %@",_info);
//    self.HeaderLabel.text = _info[@"key"];
}
@end
