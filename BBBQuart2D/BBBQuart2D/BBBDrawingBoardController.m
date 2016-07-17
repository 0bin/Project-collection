//
//  BBBDrawingBoardController.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/16.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBDrawingBoardController.h"
#import "BBBDrawBoardView.h"

@interface BBBDrawingBoardController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet BBBDrawBoardView *drawBoardView;

@end

@implementation BBBDrawingBoardController

- (void)viewDidLoad {
    [super viewDidLoad];


    
}
- (IBAction)changeColor:(UIButton *)sender {
    self.drawBoardView.lineColor = sender.backgroundColor;
}

/** 保存图片到相册*/
- (IBAction)saveButtonClick:(UIButton *)sender {
    UIGraphicsBeginImageContextWithOptions(self.drawBoardView.bounds.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.drawBoardView.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"save success");
}

- (IBAction)cleanButtonClick:(UIButton *)sender {
    [self.drawBoardView cleanAll];
}

- (IBAction)cancelButtonClick:(UIButton *)sender {
    [self.drawBoardView cancelLast];
}

- (IBAction)imageButtonClick:(UIButton *)sender {
    /** 打开相册*/
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    [picker setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)slideChange:(UISlider *)sender {
    self.drawBoardView.lineWidth = sender.value;
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{   /** 获取选中图片*/
    self.drawBoardView.image = info[UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
