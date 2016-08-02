//
//  BBBSubLayerViewController.m
//  BBBLayer
//
//  Created by LinBin on 16/7/28.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBSubLayerViewController.h"

@interface BBBSubLayerViewController ()

@end

@implementation BBBSubLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self drawMen];
    [self drawCorner];
    [self customLabel];
    [self customAttributesLabel];
    
    
    
    
    
    
}

/**
 *  自定义label属性
 */
- (void)customAttributesLabel
{
    UIView *labelView = [[UIView alloc] init];
    labelView.backgroundColor = [UIColor lightGrayColor];
    labelView.frame = CGRectMake(150, 400, 100, 144);
    [self.view addSubview:labelView];
    //设置textLayer
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = labelView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [labelView.layer addSublayer:textLayer];
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    //设置CFFont

    NSString *string = @"wo shi zai xuexi donghua haoxiang yue xue yue fuza le.";
    NSMutableAttributedString *mString = [[NSMutableAttributedString alloc] initWithString:string];
    [mString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 20)];
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)(font.fontName);
    CGFloat fontSize = font.pointSize;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);

    textLayer.font = fontRef;
    textLayer.fontSize = fontSize;
    textLayer.string = mString;
    /**
     NSFontAttributeName字体
     NSParagraphStyleAttributeName段落格式
     NSForegroundColorAttributeName字体颜色
     NSBackgroundColorAttributeName背景颜色
     NSStrikethroughStyleAttributeName删除线格式
     NSUnderlineStyleAttributeName下划线格式
     NSStrokeColorAttributeName删除线颜色
     NSStrokeWidthAttributeName删除线宽度
     NSShadowAttributeName 阴影
     */
}


/**
 *  自定义label
 */
- (void)customLabel
{
    UIView *labelView = [[UIView alloc] init];
    labelView.backgroundColor = [UIColor lightGrayColor];
    labelView.frame = CGRectMake(20, 400, 100, 144);
    [self.view addSubview:labelView];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = labelView.bounds;
    [labelView.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    
    CFStringRef stringFount = (__bridge CFStringRef)(font.fontName);
    CGFontRef fontRef = CGFontCreateWithFontName(stringFount);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *string = @"today we are in the new place......@xxx and==========";
    textLayer.string = string;


}




/**
 *  定制圆角
 */
- (void)drawCorner
{
    CGRect rect = CGRectMake(100, 300, 100, 100);
    CGSize size = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopLeft | UIRectCornerTopRight;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:size];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path1.CGPath;
    [self.view.layer addSublayer:shapeLayer];
}

/**
 *  画人
 */
- (void)drawMen
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(175, 100)];
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.path = path.CGPath;
    [self.view.layer addSublayer:shapeLayer];

}

@end
