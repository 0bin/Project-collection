//
//  BBBSpritesViewController.m
//  BBBLayer
//
//  Created by LinBin on 16/7/21.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBSpritesViewController.h"

@interface BBBSpritesViewController ()

@end

@implementation BBBSpritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *one = [[UIImageView alloc] initWithFrame:CGRectMake(20, 88, 88, 88)];
    [self.view addSubview:one];
    
    UIImageView *two = [[UIImageView alloc] initWithFrame:CGRectMake(120, 88, 88, 88)];
    [self.view addSubview:two];
    
    UIImageView *three = [[UIImageView alloc] initWithFrame:CGRectMake(20, 180, 88, 88)];
    [self.view addSubview:three];
    
    UIImageView *four = [[UIImageView alloc] initWithFrame:CGRectMake(120, 180, 88, 88)];
    [self.view addSubview:four];    
    
    UIImage *image = [UIImage imageNamed:@"111"];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:one.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:two.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:three.layer];
    [self addSpriteImage:image withContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:four.layer];
 
}


/**
 *  图片分割
 *
 *  @param image 大图
 *  @param rect  小图在大图内的范围
 *  @param layer 小图的layer
 */
- (void)addSpriteImage:(UIImage *)image withContentRect:(CGRect)rect toLayer:(CALayer *)layer
{
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contentsRect = rect;
}
@end
