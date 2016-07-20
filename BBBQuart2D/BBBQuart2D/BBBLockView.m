//
//  BBBLockView.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/19.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBLockView.h"

@interface BBBLockView ()

@property (strong, nonatomic) NSMutableArray *buttonArray;

@property (assign, nonatomic) CGPoint point;

@end

@implementation BBBLockView

- (NSMutableArray *)buttonArray
{
    if (_buttonArray == nil) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor grayColor]];
        [self addButton];
    }
    return self;

}

/**
 *  添加button
 */
- (void)addButton
{
    NSInteger buttonCount = 9;
    NSInteger column = 3;
    CGFloat buttonW = 74;
    CGFloat buttonH = 74;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width - column * buttonW) / (column + 1);
    
    for (NSInteger i = 0; i < buttonCount; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        [button setUserInteractionEnabled:NO];//设置不接受交互，不然会影响pan交互
        CGFloat buttonX = i % column * (buttonW + margin) + margin;
        CGFloat buttonY = i / column * (buttonH + margin) ;
        [button setFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        [self addSubview:button];
    }
    /** 添加手势 */
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    self.point = [pan locationInView:self];
    for (UIButton *button in self.subviews) {
        if (CGRectContainsPoint(button.frame, self.point) && button.selected == NO){
            button.selected = YES;
            [self.buttonArray addObject:button];
        }
    }
    [self setNeedsDisplay];

    if (pan.state == UIGestureRecognizerStateEnded){
        NSMutableString *stringPSW = [NSMutableString string];
        for (UIButton *button in self.buttonArray){
                [stringPSW appendFormat:@"%ld",button.tag];
                button.selected = NO;
            }
        [self.buttonArray removeAllObjects];
        [self setNeedsDisplay];

        if ([stringPSW isEqualToString:@"012"]) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"解锁成功" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
            } else {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入错误" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
            }
    }
    

}





- (void)drawRect:(CGRect)rect
{
    if (self.buttonArray.count == 0) {
        return;
    }
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (NSInteger i = 0; i < self.buttonArray.count; i++) {
        UIButton *button = self.buttonArray[i];
        if (i == 0) {
            [path moveToPoint:button.center];
        } else {
            [path addLineToPoint:button.center];
        }
    }
    [path addLineToPoint:self.point];
    [[UIColor redColor] set];
    path.lineWidth = 10;
    path.lineJoinStyle = kCGLineJoinRound;
    [path stroke];
    
}


@end
