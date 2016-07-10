//
//  BBBPositionViewController.m
//  BBBAnimation
//
//  Created by LinBin on 16/7/9.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBPositionViewController.h"

@interface BBBPositionViewController ()
/**
 *  <#Description#>
 */
@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *yellowView;
@property (strong, nonatomic) UIView *blueView;
@end

@implementation BBBPositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *red = [[UIView alloc] init];
    red.frame = CGRectMake(20, 264, 44, 44);
    red.backgroundColor = [UIColor redColor];
    [self.view addSubview:red];
    self.redView = red;
    
    UIView *yellow = [[UIView alloc] init];
    yellow.frame = CGRectMake(20, 124, 44, 44);
    yellow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellow];
    self.yellowView = yellow;
    
    UIView *blue = [[UIView alloc] init];
    blue.frame = CGRectMake(20, 184, 44, 44);
    blue.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blue];
    self.blueView = blue;
}

- (void)viewDidAppear:(BOOL)animated
{
    //[self.redView setTransform:CGAffineTransformMake(1, 1, -1, 1, 0, 0)];
    //  ad缩放bc旋转tx,ty位移
    //  a：x轴缩放 d：y轴缩放 tx：x轴偏移 ty：y轴偏移
    //  b：默认0：正:(0,0)与(x,y)上下拉扯。负:(x,0)与(0,y)上下拉扯
    //  c：默认0：正:(0,0)与(x,y)左右拉扯 。 负:(x,0)与(0,y)左右拉扯
    //a=d=1, b=c=0，水平移动
    //b=c=tx=ty=0.缩放
    //设tx=ty=0，a=cosɵ，b=sinɵ，c=-sinɵ，d=cosɵ  旋转缩放.
    [UIView animateWithDuration:3.0 animations:^{

        CGAffineTransform transformScale = CGAffineTransformMakeScale(1,2);
        CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(20, 0.5);
        [self.redView setTransform:CGAffineTransformConcat(transformScale, transformTranslate)];
        
    }];

    [UIView animateWithDuration:3.0 animations:^{
        
        [self.yellowView setTransform:CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.2)];
    } completion:^(BOOL finished) {
        
        
    }];
    
    [UIView animateWithDuration:2.0 delay:0.2 usingSpringWithDamping:0.1 initialSpringVelocity:0.1 options:UIViewAnimationOptionAutoreverse  animations:^{
        
        self.blueView.center = CGPointMake(120, 200);
        
    } completion:^(BOOL finished) {
        
        
    }];

///** 复杂写法  */
//    //首尾式动画
//    [UIView beginAnimations:nil context:nil];
//    //执行动画
//    //设置动画执行时间
//    [UIView setAnimationDuration:2.0];
//    //设置代理
//    [UIView setAnimationDelegate:self];
//    //设置动画执行完毕调用的事件
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationDidStopSelector:@selector(didStopAnimation)];
//    self.redView.center = CGPointMake(200, 300);
//    [UIView commitAnimations];

}

- (void)didStopAnimation
{
//    /** 简便写法  */
//    [UIView animateWithDuration:2.0 delay:0.1 usingSpringWithDamping:0.1 initialSpringVelocity:0.1 options:UIViewAnimationOptionAutoreverse   animations:^{
//        self.redView.center = CGPointMake(200, 500);
//        self.redView.alpha = 0.5;
//        [self.redView setBackgroundColor:[UIColor blueColor]];
//        
//    } completion:^(BOOL finished) {
//
//        [UIView animateKeyframesWithDuration:4.0 delay:0.1 options:UIViewKeyframeAnimationOptionAutoreverse  animations:^{
//            
//            [UIView addKeyframeWithRelativeStartTime:0.1 relativeDuration:2.0 animations:^{
//                self.redView.frame = CGRectMake(20, 64, 20, 20);
//            }];
//            
//            [UIView addKeyframeWithRelativeStartTime:0.1 relativeDuration:2.0 animations:^{
//                self.redView.frame = CGRectMake(300, 234, 50, 100);
//                self.redView.backgroundColor = [UIColor grayColor];
//            }];
//            
//            
//        } completion:^(BOOL finished) {
//            
//        }];
//        
//    }];
    

}


@end
