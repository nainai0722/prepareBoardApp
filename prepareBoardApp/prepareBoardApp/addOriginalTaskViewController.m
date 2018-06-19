//
//  addOriginalTaskViewController.m
//  prepareBoardApp
//
//  Created by apple on 2018/06/11.
//  Copyright © 2018年 com.nainai0722. All rights reserved.
//

#import "addOriginalTaskViewController.h"
#import "TaskListTableViewController.h"

@interface addOriginalTaskViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *addOriginalTaskImage;
@property (weak, nonatomic) IBOutlet UITextField *addoriginalTaskName;



@end

@implementation addOriginalTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)touchBackView:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)touchRegistTaskBtn:(UIButton *)sender {
    if(self.fromView == 2){
        [self.delegate updateTaskDetailActin:self.addoriginalTaskName.text img:self.addOriginalTaskImage.image indexPath:self.fromViewIndexPath];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:self.addoriginalTaskName.text forKey:@"taskName"];
        [ud synchronize];
        TaskListTableViewController *vc = [[TaskListTableViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
}
- (IBAction)touchSelectTaskImageBtn:(UIButton *)sender{
    
    UIImagePickerController *imgPic = [[UIImagePickerController alloc]init];
    imgPic.delegate = self;
    [imgPic setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController: imgPic animated:YES completion:nil];
}
- (void)imagePickerController :(UIImagePickerController *)picker
        didFinishPickingImage :(UIImage *)image editingInfo :(NSDictionary *)editingInfo {
    // 読み込んだ画像表示
        UIGraphicsBeginImageContext(self.view.frame.size);
        [image drawInRect:self.view.bounds];
        UIImage *iv = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        NSData *data = UIImagePNGRepresentation(iv);
        NSString *filePath;
        self.addOriginalTaskImage.image = iv;
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        NSDictionary* imageDic = [defaults dictionaryForKey:@"imageDic"];
        int imageDicCoutnt = (int)[imageDic count]+1;
        filePath = [NSString stringWithFormat:@"%@/image%d.png", [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"],imageDicCoutnt];
        NSLog(@"filePath : %@", filePath);
    
        if ([data writeToFile:filePath atomically:YES]) {
            NSLog(@"保存OK");
            NSMutableDictionary* dictionary = [imageDic mutableCopy];
            [dictionary setObject:filePath forKey:self.addoriginalTaskName.text];
            [defaults setObject:[dictionary copy] forKey:@"imageDic"];
            [defaults synchronize];
            NSLog(@"%ld",[imageDic count]);
        } else {
            NSLog(@"Error");
        }
        
    
    //    [self.view addSubview:iv];
    
//    self.delegate updateTaskDetailActin:
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
