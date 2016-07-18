//
//  BBBWatermarkController.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/17.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBWatermarkController.h"

@interface BBBWatermarkController ()

@end

@implementation BBBWatermarkController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /** 图片剪裁*/
    UIImage *image = [UIImage imageNamed:@"123"];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawAtPoint:CGPointZero];
    NSString *string = @"@bbb";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:40];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    [string drawAtPoint:CGPointMake(image.size.width * 0.5, image.size.height - 50) withAttributes:dict];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(0, 64, 220, 220);
    [self.view addSubview:imageView];
    
    [self OvalImage];
    [self captureScreen];
    
    
}

 /** 图片剪裁并添加框线*/
- (void)OvalImage
{
    UIImage *image = [UIImage imageNamed:@"1234"];
    CGFloat borderWidth = 5;
    CGFloat ovalWidth = image.size.width + 2 * borderWidth;
    CGFloat ovalHeight = image.size.height + 2 * borderWidth;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWidth, ovalHeight), NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWidth, ovalHeight)];
    [[UIColor redColor] set];
    [path fill];
    
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, image.size.width, image.size.height)];
    [clipPath addClip];
    
    [image drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    UIImage *ovalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:ovalImage];
    imageView.frame = CGRectMake(20, 364, 78, 78);
    [self.view addSubview:imageView];
    
    
}

 /** 屏幕截图 */
- (void)captureScreen
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    UIImage *captureImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:captureImage];
    imageView.frame = CGRectMake(220, 364, 78, 78);
    [self.view addSubview:imageView];

}



@end
