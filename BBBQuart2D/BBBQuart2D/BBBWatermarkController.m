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
    
    UIImage *image = [UIImage imageNamed:@"123"];
//    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [image drawAtPoint:CGPointZero];
    NSString *string = @"@bbb";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:40];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    [string drawAtPoint:CGPointMake(200, 200) withAttributes:dict];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(0, 64, 220, 220);
    [self.view addSubview:imageView];
    
    
}





@end
