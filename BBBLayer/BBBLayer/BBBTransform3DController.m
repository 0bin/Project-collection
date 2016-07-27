//
//  BBBTransform3DController.m
//  BBBLayer
//
//  Created by LinBin on 16/7/27.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBTransform3DController.h"

@interface BBBTransform3DController ()

@end

@implementation BBBTransform3DController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *containerView = [[UIView alloc] init];
    containerView.frame = CGRectMake(40, 104, 200, 200);
    containerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:containerView];
    CGSize containerSize = containerView.bounds.size;
    
    CATransform3D tranform = CATransform3DIdentity;
    tranform.m34 = -1 / 500;
    containerView.layer.sublayerTransform = tranform;
    
    
    UIView *oneView = [[UIView alloc] init];
    oneView.center = CGPointMake(containerSize.width * 0.5, containerSize.height * 0.5);
    CATransform3D tranform1 = CATransform3DMakeTranslation(0, 0, 100);
    oneView.layer.transform = tranform1;
    [containerView addSubview:oneView];
    
    UIView *twoView = [[UIView alloc] init];
    twoView.center = CGPointMake(containerSize.width * 0.5, containerSize.height * 0.5);
    tranform1 = CATransform3DMakeTranslation(100, 0, 0);
    tranform1 = CATransform3DRotate(tranform1, M_PI_2, 0, 1, 0);
    twoView.layer.transform = tranform1;
    [containerView addSubview:twoView];
    
    UIView *threeView = [[UIView alloc] init];
    threeView.center = CGPointMake(containerSize.width * 0.5, containerSize.height * 0.5);
    tranform1 = CATransform3DMakeTranslation(0, -100, 0);
    tranform1 = CATransform3DRotate(tranform1, M_PI_2, 1, 0, 0);
    threeView.layer.transform = tranform1;
    [containerView addSubview:threeView];
    
    UIView *fourView = [[UIView alloc] init];
    fourView.center = CGPointMake(containerSize.width * 0.5, containerSize.height * 0.5);
    tranform1 = CATransform3DMakeTranslation(0, 100, 0);
    tranform1 = CATransform3DRotate(tranform1, -M_PI_2, 1, 0, 0);
    fourView.layer.transform = tranform1;
    [containerView addSubview:fourView];
    
    UIView *fiveView = [[UIView alloc] init];
    fiveView.center = CGPointMake(containerSize.width * 0.5, containerSize.height * 0.5);
    tranform1 = CATransform3DMakeTranslation(-100, 0, 0);
    tranform1 = CATransform3DRotate(tranform1, -M_PI_2, 0, 1, 0);
    fiveView.layer.transform = tranform1;
    [containerView addSubview:fiveView];
    
    UIView *sixView = [[UIView alloc] init];
    sixView.center = CGPointMake(containerSize.width * 0.5, containerSize.height * 0.5);
    tranform1 = CATransform3DMakeTranslation(0, 0, -100);
    tranform1 = CATransform3DRotate(tranform1, M_PI_2, 0, 1, 0);
    fiveView.layer.transform = tranform1;
    [containerView addSubview:sixView];
    

    tranform = CATransform3DRotate(tranform, -M_PI_4, 1, 0, 0);
    tranform = CATransform3DRotate(tranform, -M_PI_4, 0, 1, 0);

    
    

    
}



@end
