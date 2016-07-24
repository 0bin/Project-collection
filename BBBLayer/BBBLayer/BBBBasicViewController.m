//
//  BBBBasicViewController.m
//  BBBLayer
//
//  Created by LinBin on 16/7/22.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBBasicViewController.h"

@interface BBBBasicViewController ()

@end

@implementation BBBBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addBlueView];
    [self setShadow];
    [self addLayerImage];
   
}


///** layer 代理绘制图片 */
//- (void)drawLayerImage
//{
//    CALayer *layer = [CALayer layer];
//    [layer setFrame:CGRectMake(200, 160, 150, 150)];
//    layer.backgroundColor = [UIColor purpleColor].CGColor;
//    layer.delegate = self;
//    layer.contentsScale = [UIScreen mainScreen].scale;
//    [self.view.layer addSublayer:layer];
//    [layer display];
//}

//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
//{
//    CGContextSetLineWidth(ctx, 10);
//    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
//    CGContextStrokeEllipseInRect(ctx, layer.bounds);
//
//}




 /** layer content 图片 */
- (void)addLayerImage
{
    CALayer *layer = [CALayer layer];
    [layer setFrame:CGRectMake(20, 140, 150, 150)];
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"2"].CGImage);
    [layer setContentsGravity:kCAGravityResizeAspect];
    layer.contentsScale = [UIScreen mainScreen].scale;
    [layer setContentsRect:CGRectMake(0, 0, 0.9, 0.9)];
//    layer.contentsCenter = CGRectMake(0.5, 0.5, 0.5, 0.5);//图片拉伸区域

    [self.view.layer addSublayer:layer];
}




- (void)addBlueView
{
    UIView *blueView = [[UIView alloc] init];
    [blueView setFrame:CGRectMake(180, 84, 66, 66)];
    [blueView setBackgroundColor:[UIColor blueColor]];
    /** 设置圆角 */
    blueView.layer.cornerRadius = 15;
    //    blueView.layer.masksToBounds = YES;
    /** 设置边框线 */
    blueView.layer.borderColor = [UIColor blackColor].CGColor;
    blueView.layer.borderWidth = 5;
    /** 设置3D效果 */
    blueView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0.5, 0.5, 0.5);
    [self.view addSubview:blueView];

}

/**
 *  view阴影设置
 */
- (void)setShadow
{
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(20, 84, 100, 44);
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"button" forState:UIControlStateNormal];
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 1;
    button.layer.shadowOffset = CGSizeMake(1, 1);
    //    button.layer.shadowRadius = 3;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, button.bounds);
    button.layer.shadowPath = path;
    [self.view addSubview:button];
    CGPathRelease(path);

}
@end
