//
//  TaskListDetailTableViewCell.h
//  prepareBoardApp
//0
//  Created by apple on 2018/06/05.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface TaskListDetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *HeaderLabel;
@property (weak, nonatomic) IBOutlet UIButton *AddBtn;
@property (weak, nonatomic) IBOutlet UIButton *DeleteBtn;
@property (weak, nonatomic)  NSDictionary *info;
@property (nonatomic)  NSMutableArray *prepareActionList;

@end
