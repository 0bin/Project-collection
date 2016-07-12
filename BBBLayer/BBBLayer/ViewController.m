//
//  ViewController.m
//  BBBLayer
//
//  Created by LinBin on 16/7/11.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIButton *button;
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button setFrame:CGRectMake(20, 64, 66, 44)];
    /** 设置阴影 */
    button.layer.shadowColor = [UIColor grayColor].CGColor;
    button.layer.shadowOpacity = 0.5;
    button.layer.shadowOffset = CGSizeMake(10, 10);
//    button.layer.shadowRadius = 0.5;
//    //创建CGMutablePathRef
//    CGMutablePathRef path = CGPathCreateMutable();
//    //绘制Path
//    CGRect rect = CGRectInset(self.view.bounds, 30, 30);
//    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
//    CGPathAddLineToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetHeight(rect));
//    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(rect), CGRectGetHeight(rect) * 2 / 3);
//    CGPathCloseSubpath(path);
//    button.layer.shadowPath =  path;
    
    [self.view addSubview:button];
    self.button = button;
    
    
    UIView *blueView = [[UIView alloc] init];
    [blueView setFrame:CGRectMake(180, 64, 66, 66)];
    [blueView setBackgroundColor:[UIColor blueColor]];
    /** 设置圆角 */
    blueView.layer.cornerRadius = 5;
//    blueView.layer.masksToBounds = YES;//content层无内容不需要写
    /** 设置边框线 */
    blueView.layer.borderColor = [UIColor blackColor].CGColor;
    blueView.layer.borderWidth = 5;
    /** 设置3D效果 */
    blueView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    [self.view addSubview:blueView];
    self.blueView = blueView;
    
    [self addLayer];
    [self addLayerCustom];
    
}
/** 添加layer，layer轻量级，无点击事件用layer */
- (void)addLayer
{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(20, 300, 88, 88);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.contents = (id)[UIImage imageNamed:@"123"].CGImage;
    [self.view.layer addSublayer:layer];
    
}
/** 自定义layer,继承layer 或 代理layer */
- (void)addLayerCustom
{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(20, 400, 66, 66);
//    layer.backgroundColor = [UIColor greenColor].CGColor;
    layer.delegate = self;
    [self.view.layer addSublayer:layer];
    [layer setNeedsDisplay];
    

}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 10);
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    // 添加一个跟层一样大的矩形到路径中
    CGContextAddRect(ctx, layer.bounds);
    // 绘制路径
    CGContextStrokePath(ctx);
    
    
}

//- (void)drawStar
//{
//    CGContextSetRGBFillColor(ctx, 135.0/255.0, 232.0/255.0, 84.0/255.0, 1);
//    CGContextSetRGBStrokeColor(ctx, 135.0/255.0, 232.0/255.0, 84.0/255.0, 1);
//    //    CGContextFillRect(ctx, CGRectMake(0, 0, 100, 100));
//    //    CGContextFillEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
//    CGContextMoveToPoint(ctx, 94.5, 33.5);
//    
//    //// Star Drawing
//    CGContextAddLineToPoint(ctx,104.02, 47.39);
//    CGContextAddLineToPoint(ctx,120.18, 52.16);
//    CGContextAddLineToPoint(ctx,109.91, 65.51);
//    CGContextAddLineToPoint(ctx,110.37, 82.34);
//    CGContextAddLineToPoint(ctx,94.5, 76.7);
//    CGContextAddLineToPoint(ctx,78.63, 82.34);
//    CGContextAddLineToPoint(ctx,79.09, 65.51);
//    CGContextAddLineToPoint(ctx,68.82, 52.16);
//    CGContextAddLineToPoint(ctx,84.98, 47.39);
//    CGContextClosePath(ctx);
//    
//    CGContextDrawPath(ctx, kCGPathFillStroke);
//
//}

@end
