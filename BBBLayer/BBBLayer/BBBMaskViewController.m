//
//  BBBMaskViewController.m
//  BBBLayer
//
//  Created by LinBin on 16/7/25.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBMaskViewController.h"

@interface BBBMaskViewController ()

@end

@implementation BBBMaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(80, 80, 200, 200);
    [imageView setImage:[UIImage imageNamed:@"3"]];
    [self.view addSubview:imageView];
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(80, 80, 100, 100);
    
    UIImage *image = [UIImage imageNamed:@"2"];
    maskLayer.contents = (__bridge id _Nullable)(image.CGImage);
    
    imageView.layer.mask = maskLayer;
    
    
    
}



@end
