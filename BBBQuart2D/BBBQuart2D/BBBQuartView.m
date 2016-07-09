//
//  BBBQuartView.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/9.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBQuartView.h"

@implementation BBBQuartView

/**点击重画*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}


/**随机颜色*/
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r  green:g blue:b alpha:1];
}


/**随机数据*/
- (NSArray *)arrRandom
{
    int totoal = 100;
    NSMutableArray *arrM = [NSMutableArray array];
    int temp = 0; // 30 40 30
    for (int i = 0; i < arc4random_uniform(10) + 1; i++) {
        temp = arc4random_uniform(totoal) + 1;
        // 随机出来的临时值等于总值，直接退出循环，因为已经把总数分配完毕，没必要在分配。
        [arrM addObject:@(temp)];
        // 解决方式：当随机出来的数等于总数直接退出循环。
        if (temp == totoal) {
            break;
        }
        totoal -= temp;
    }
    if (totoal) {
        [arrM addObject:@(totoal)];
    }
    return arrM;
}



- (void)drawRect:(CGRect)rect
{
    [self drawBarChart:rect];
    [self drawPieChart];

}



/** 柱状图  */
- (void)drawBarChart:(CGRect)rect
{
    NSArray *arr = [self arrRandom];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    for (int i = 0; i < arr.count; i++) {
        w = rect.size.width / (2 * arr.count - 1);
        x = 2 * w * i;
        h = [arr[i] floatValue] / 100.0 * rect.size.height;
        y = rect.size.height - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        [[self randomColor] set];
        [path fill];
        
    }
}

/** 饼状图  */
- (void)drawPieChart
{
    NSArray *arr = @[@5, @30, @20, @10, @35];
//    NSArray *colorArr = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor]];
    CGFloat radius = self.bounds.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    for (int i = 0; i < arr.count; i++) {
        startA = endA;
        angle = [arr[i] floatValue] / 100 * 2 * M_PI;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[self randomColor] set];
        [path fill];
    }

}


/** 扇形  */
- (void)drawSector
{
    /** 圆角矩形  */
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(40, 50, 40, 60) cornerRadius:5];
    [path2 stroke];
    [path2 fill];
    /** 圆弧
     * Center: 圆心
     * angle:  弧度
     * clockwise: yes是顺时针
     */
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(125, 125) radius:100 startAngle:0 endAngle:M_PI clockwise:YES];
    
    [path1 stroke];
    
    
    
    CGPoint center = CGPointMake(125, 125);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:80 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:center];
    /** 如果使用填充，会自动关闭路径 */
    [path fill];
    
    /** 关闭路径
     * 默认从终点画到起点
     */
    // [path closePath];
    
}


/** 画线方式1 */
- (void)drawLine
{
    /** 获取图形上下文 */
    CGContextRef context = UIGraphicsGetCurrentContext();
    /** 获取路径 */
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 50, 200);
    /** 直接添加第三个点，默认上一根线的终点是下一根线的起点 */
    CGContextAddLineToPoint(context, 200, 50);
    
    /** 设置绘图状态, 一定要在渲染之前 */
    /** 颜色 */
    [[UIColor redColor] setStroke];
    /** 线宽 */
    CGContextSetLineWidth(context, 10);
    /** 设置连接样式 */
    CGContextSetLineJoin(context, kCGLineJoinRound);/** 圆拐角 */
    /** 设置顶角样式 */
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);

}

/** 画线方式2 */
- (void)drawLineEasy
{
    /** 获取上下文 */
    CGContextRef context = UIGraphicsGetCurrentContext();
    /** 描述路径 */
    /** 设置起点 */
    CGContextMoveToPoint(context, 50, 50);
    /** 设置终点 */
    CGContextAddLineToPoint(context, 200, 200);
    /** 渲染上下文 */
    CGContextStrokePath(context);
}

/** 画线方式3 绘制贝塞尔线 */
- (void)drawBezierLine
{
    /** 创建路径 */
    UIBezierPath *path = [UIBezierPath bezierPath];
    /** 设置起点 */
    [path moveToPoint:CGPointMake(50, 50)];
    /** 添加一个线 */
    [path addLineToPoint:CGPointMake(200, 200)];
    /** 渲染 */
    [path stroke];

}

 /** 绘制曲线 */
- (void)drawCurveLine
{
    /** 1.获取 */
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /** 2.描述路径 */
    /** 一定要有起点 */
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddQuadCurveToPoint(context, 150, 20, 250, 50);
    
    /** 3.渲染上下文 */
    CGContextStrokePath(context);
    
}





@end
