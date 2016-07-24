//
//  BBBScratchController.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/19.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBScratchController.h"

@interface BBBScratchController ()

@property (weak, nonatomic) UIImageView *coverImage;

@end

@implementation BBBScratchController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"123"]];
    imageView.frame = CGRectMake(20, 100, 220, 220);
    [self.view addSubview:imageView];

    
    UIImageView *coverImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1234"]];
    coverImage.frame = CGRectMake(20, 100, 220, 220);
    [self.view addSubview:coverImage];
    self.coverImage = coverImage;

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    /**图片擦除*/
    UITouch *touch = touches.anyObject;
    CGPoint currentP = [touch locationInView:self.coverImage];
    CGRect rect = CGRectMake(currentP.x, currentP.y, 20, 20);
    UIGraphicsBeginImageContextWithOptions(self.coverImage.bounds.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.coverImage.layer renderInContext:context];
    CGContextClearRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    self.coverImage.layer.shouldRasterize = YES;
    self.coverImage.image = image;
    UIGraphicsEndImageContext();
    


}



@end
