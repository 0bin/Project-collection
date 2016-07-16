//
//  BBBDrawBoardView.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/16.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBDrawBoardView.h"

@interface BBBDrawBoardView ()

@property (strong, nonatomic) NSMutableArray *pathsArray;
@property (strong, nonatomic) UIBezierPath *path;

@end

@implementation BBBDrawBoardView

- (NSMutableArray *)pathsArray
{
    if (_pathsArray == nil) {
        _pathsArray = [NSMutableArray array];
    }
    return _pathsArray;

}

- (void)drawRect:(CGRect)rect {
    for (UIBezierPath *path in self.pathsArray) {
        [path stroke];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addPan];
    }
    return self;
}

- (void)awakeFromNib
{
    [self addPan];
}

/**  添加手势 */
- (void)addPan
{
    UIGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClikc:)];
    [self addGestureRecognizer:pan];
}

/** 手势监听方法 - 画线*/
- (void)panClikc:(UIPanGestureRecognizer *)pan
{
    CGPoint Point = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.path = [UIBezierPath bezierPath];
        [self.path moveToPoint:Point];
        [self.pathsArray addObject:self.path];
    }
    [self.path addLineToPoint:Point];
    [self setNeedsDisplay];
}


@end
