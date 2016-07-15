//
//  BBBQuart2DView.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/15.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBQuart2DView.h"

@interface BBBQuart2DView ()

@end

@implementation BBBQuart2DView

- (void)setProgroessValue:(CGFloat)progroessValue
{
    _progroessValue = progroessValue;

    [self setNeedsDisplay];

}

- (void)drawRect:(CGRect)rect {
    [self drawLineEasy];
    [self drawCurveLine];
    [self drawSector];
    [self drawPieChart];
    CGRect rect1 = CGRectMake(100, 100, 100, 300);
    [self drawBarChartInRect:rect1];
    [self drawProgrsess:self.progroessValue];
    /** 画文字  */
    NSString *string = @"hello world!!!";
    [string drawInRect:CGRectMake(100, 400, 100, 44) withAttributes:nil];
    /** 画图  */
    UIImage *image = [UIImage imageNamed:@"123"];
    [image drawInRect:CGRectMake(200, 400, 66, 66)];
    
}



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


/** 加载进度指示图  */
- (void)drawProgrsess:(CGFloat)progress
{
    CGFloat radius = 50;
    CGPoint center = CGPointMake(150,450);
    CGFloat endA = -M_PI_2 + progress * M_PI * 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius - 2 startAngle:-M_PI_2 endAngle:endA clockwise:YES];
    [[UIColor blackColor] set];
    [path setLineWidth:10];
    [path stroke];

}

/** 柱状图  */
- (void)drawBarChartInRect:(CGRect)rect
{
    NSArray *array = @[@5, @30, @20, @10, @35];
    CGFloat x = 20;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    for (NSInteger i = 0; i < array.count; i++) {
        w = rect.size.width / (2 * array.count - 1);
        x = 2 * w * i;
        h = [array[i] floatValue] / 100.0 * rect.size.height;
        y = rect.size.height - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        [[UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0] set];
        [path fill];
    }
}


/** 饼状图  */
- (void)drawPieChart
{
    NSArray *array = @[@5, @30, @20, @10, @35];
    CGPoint center = CGPointMake(250, 300);
    CGFloat startAngle = 0;
    CGFloat endAngle =0;
    CGFloat angle = 0;
    
    for (NSInteger i = 0; i < array.count; i++) {
        startAngle = endAngle;
        angle = [array[i] floatValue] / 100 * 2 * M_PI;
        endAngle = startAngle + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:80 startAngle:startAngle endAngle:endAngle clockwise:YES];
        [path addLineToPoint:center];
        [[UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0] set];
        [path fill];
    }
}



/** 原形  */
- (void)drawSector
{
    /** 圆角矩形  */
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 50, 100, 30) cornerRadius:5];
    [path2 stroke];
//    [path2 fill];
    /** 圆弧  */
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:30 startAngle:0 endAngle:M_PI clockwise:YES];
    [path1 stroke];
//    [path1 fill];
    
     /** 扇形  */
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 100) radius:40 startAngle:0 endAngle:M_PI_4 clockwise:YES];
    [path addLineToPoint:CGPointMake(200, 100)];
    [path closePath];
    [path stroke];

}


/** 绘制曲线 */
- (void)drawCurveLine
{
    /** 1.获取 */
    CGContextRef context = UIGraphicsGetCurrentContext();
    /** 2.路径 */
    CGContextMoveToPoint(context, 0, 10);
    CGContextAddQuadCurveToPoint(context, 50, 150, 150, 50);
    /** 3.渲染上下文 */
    CGContextStrokePath(context);
    
}


/** 画线方式1 */
- (void)drawLineEasy
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 100,100);
    CGContextSetLineWidth(context, 2);
    [[UIColor redColor] setStroke];
    CGContextStrokePath(context);

}

/** 画线方式2 */
- (void)drawLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 50, 200);
    CGContextAddLineToPoint(context, 200, 50);
    [[UIColor blueColor] setStroke];
    CGContextSetLineWidth(context, 2);
    /** 设置连接样式 */
    CGContextSetLineJoin(context, kCGLineJoinRound);/** 圆拐角 */
    /** 设置顶角样式 */
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);
}

/** 画线方式3 绘制贝塞尔线 */
- (void)drawBezierLine
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(150, 50)];
    [path addLineToPoint:CGPointMake(50, 20)];
    [path addLineToPoint:CGPointMake(150, 220)];
    /** 渲染 */
    [path stroke];
}

@end
