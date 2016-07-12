//
//  UIViewAnimationController.m
//  BBBAnimation
//
//  Created by LinBin on 16/7/11.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "UIViewAnimationController.h"

@interface UIViewAnimationController ()

@property (weak, nonatomic) UIView *redView;
@property (weak, nonatomic) UIView *yellowView;
@property (strong, nonatomic) UIView *blueView;
@property (weak, nonatomic) UIView *contentView;

@end



@implementation UIViewAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *contentView = [[UIView alloc] init];
    contentView.frame = CGRectMake(100, 164, 44, 44);
    [self.view addSubview:contentView];
    self.contentView = contentView;
    
    UIView *red = [[UIView alloc] init];
    red.frame = CGRectMake(0, 0, 44, 44);
    red.backgroundColor = [UIColor redColor];
    [contentView addSubview:red];
    self.redView = red;
    


}


- (IBAction)buttonClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 0:
            [self setAnimationMove];
            break;
            
        case 1:
            [self setAnimationOpaque];
            break;
            
        case 2:
            [self setAnimationScale];
            break;
            
        case 3:
            [self setAnimationRotation];
            break;
            
        case 4:
            [self setAnimationSpring];
            break;
            
        case 5:
            [self setAnimationGroup];
            break;
            
        case 6:
            [self setAnimationGroup2];
            break;
        case 7:
            [self setTransition];
            break;
        case 8:
            [self setTransition1];
            break;
        default:
            break;
    }
}

- (void)setTransition
{
    [UIView transitionWithView:self.yellowView duration:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        UIView *yellowView = [[UIView alloc] init];
        yellowView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 333);
        yellowView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:yellowView];
        self.yellowView = yellowView;
    } completion:^(BOOL finished) {
        [self.yellowView removeFromSuperview];
        
    }];

}
- (void)setTransition1
{
    self.blueView = [[UIView alloc] init];
    self.blueView.frame = CGRectMake(0, 0, 44, 44);
    self.blueView.backgroundColor = [UIColor blueColor];
    
    [UIView transitionFromView:self.redView toView:self.blueView duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        [self.blueView removeFromSuperview];
        
    }];
    
}

- (void)setAnimationMove
{
    [UIView animateWithDuration:2.0 delay:0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.redView.center = CGPointMake(122, 300);
    } completion:^(BOOL finished) {
        self.redView.frame = CGRectMake(100, 164, 44, 44);
    }];
}

- (void)setAnimationOpaque
{
    [UIView animateWithDuration:2.0 delay:0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [self.redView setAlpha:0.1];
        self.redView.backgroundColor = [UIColor blueColor];
    } completion:^(BOOL finished) {
        [self.redView setAlpha:1];
        self.redView.backgroundColor = [UIColor redColor];
    }];
}

- (void)setAnimationScale
{
    [UIView animateWithDuration:2.0 animations:^{
        self.redView.frame = CGRectMake(100, 164, 5, 5);
    }completion:^(BOOL finished) {
        self.redView.frame = CGRectMake(100, 164, 44, 44);
    }];
}

- (void)setAnimationRotation
{
    [UIView animateWithDuration:1.0 animations:^{
        //        [self.redView setTransform:CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2)];
        [self.redView setTransform:CGAffineTransformMakeRotation(M_PI)];
    }];
}

- (void)setAnimationSpring
{
    [UIView animateWithDuration:1.0 delay:0.1 usingSpringWithDamping:0.1 initialSpringVelocity:0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.redView.center = CGPointMake(122, 300);
    } completion:^(BOOL finished) {
        self.redView.frame = CGRectMake(100, 164, 44, 44);
    }];
}

- (void)setAnimationGroup
{
    /**
     *  startTime和relativeDuration都是相对与整个关键帧动画的持续时间，
       比如（2秒）的百分比，设置成0.5就代表2*0.5＝1（秒）。
     */
    [UIView animateKeyframesWithDuration:6.0 delay:0.0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.2 animations:^{
            self.redView.frame = CGRectMake(20, 164, 44, 44);
//            [self.redView setTransform:CGAffineTransformMakeTranslation(100, 300)];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.2 animations:^{
//            [self.redView setTransform:CGAffineTransformMakeTranslation(200, 164)];
            self.redView.frame = CGRectMake(220, 164, 88, 88);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.2 animations:^{
//            [self.redView setTransform:CGAffineTransformMakeTranslation(100, 264)];
            self.redView.frame = CGRectMake(220, 64, 22, 22);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
//            [self.redView setTransform:CGAffineTransformMakeTranslation(100, 100)];
            self.redView.frame = CGRectMake(20, 64, 44, 99);
        }];
//        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
//            [self.redView setTransform:CGAffineTransformMakeScale(2, 2)];
//        }];
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:1.0 animations:^{
            [self.redView setTransform:CGAffineTransformMakeRotation(M_PI)];
        }];
        
    } completion:^(BOOL finished) {
        self.redView.frame = CGRectMake(100, 164, 44, 44);
        
    }];
    
}

- (void)setAnimationGroup1
{
    //  ad缩放bc旋转tx,ty位移
    //  a：x轴缩放 d：y轴缩放 tx：x轴偏移 ty：y轴偏移
    //  b：默认0：正:(0,0)与(x,y)上下拉扯。负:(x,0)与(0,y)上下拉扯
    //  c：默认0：正:(0,0)与(x,y)左右拉扯 。 负:(x,0)与(0,y)左右拉扯
    //a=d=1, b=c=0，水平移动
    //b=c=tx=ty=0.缩放
    //设tx=ty=0，a=cosɵ，b=sinɵ，c=-sinɵ，d=cosɵ  旋转缩放.
    [UIView animateKeyframesWithDuration:2.0 delay:0.1 options:UIViewKeyframeAnimationOptionAutoreverse  animations:^{
        
        [self.redView setTransform:CGAffineTransformMake(1, 1, 1, -1, 0, 0)];
    } completion:^(BOOL finished) {
        
    }];
 
}

- (void)setAnimationGroup2
{
    ///** 复杂写法  */
        //首尾式动画
        [UIView beginAnimations:nil context:nil];
        //执行动画
        //设置动画执行时间
        [UIView setAnimationDuration:2.0];
        //设置代理
        [UIView setAnimationDelegate:self];
        //设置动画执行完毕调用的事件
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDidStopSelector:@selector(didStopAnimation)];
        self.redView.center = CGPointMake(200, 300);
        self.redView.backgroundColor = [UIColor yellowColor];
        [self.redView setTransform:CGAffineTransformMakeRotation(M_PI)];
        [UIView commitAnimations];
    
}

- (void)didStopAnimation
{
    self.redView.frame = CGRectMake(100, 164, 44, 44);
    self.redView.backgroundColor = [UIColor redColor];
}

@end
