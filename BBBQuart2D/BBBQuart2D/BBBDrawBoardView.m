//
//  BBBDrawBoardView.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/16.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBDrawBoardView.h"
#import "BBBBezierPath.h"
@interface BBBDrawBoardView ()

@property (strong, nonatomic) NSMutableArray *pathsArray;
@property (strong, nonatomic) BBBBezierPath *path;

@end

@implementation BBBDrawBoardView

- (void)setImage:(UIImage *)image
{
    _image = image;
    [self.pathsArray addObject:image];
    [self setNeedsDisplay];

}

- (NSMutableArray *)pathsArray
{
    if (_pathsArray == nil) {
        _pathsArray = [NSMutableArray array];
    }
    return _pathsArray;

}

- (void)drawRect:(CGRect)rect {
    for (BBBBezierPath *path in self.pathsArray) {
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        } else {
            [path.pathColor set];
            [path stroke];
        }
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
    self.lineWidth = 1;
    self.lineColor = [UIColor blackColor];
    [self addGestureRecognizer:pan];
}

/** 手势监听方法 - 画线*/
- (void)panClikc:(UIPanGestureRecognizer *)pan
{
    CGPoint Point = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.path = [[BBBBezierPath alloc] init];
        [self.path moveToPoint:Point];
        self.path.pathColor = self.lineColor;
        [self.path setLineWidth:self.lineWidth];
        [self.pathsArray addObject:self.path];
    }
    [self.path addLineToPoint:Point];
    [self setNeedsDisplay];
}

- (void)cleanAll
{
    [self.pathsArray removeAllObjects];
    [self setNeedsDisplay];
}

- (void)cancelLast
{
    [self.pathsArray removeLastObject];
    [self setNeedsDisplay];
}
@end
