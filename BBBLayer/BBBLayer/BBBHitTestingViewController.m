//
//  BBBHitTestingViewController.m
//  BBBLayer
//
//  Created by LinBin on 16/7/24.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBHitTestingViewController.h"

@interface BBBHitTestingViewController ()
/**
 *  <#Description#>
 */
@property (weak, nonatomic) CALayer *blueLayer;
@property (weak, nonatomic) CALayer *redLayer;
@property (weak, nonatomic) CALayer *greenLayer;
@end

@implementation BBBHitTestingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 150, 200, 200);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:blueLayer];
    self.blueLayer = blueLayer;
    
    CALayer *greenLayer = [CALayer layer];
    greenLayer.frame = CGRectMake(100, 200, 80, 80);
    greenLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:greenLayer];
    self.greenLayer = greenLayer;
    
    CALayer *redLayer = [CALayer layer];
    redLayer.frame = CGRectMake(20, 100, 100, 100);
    redLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:redLayer];
    self.redLayer = redLayer;
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    point = [self.blueLayer convertPoint:point fromLayer:self.view.layer];
//    if ([self.blueLayer containsPoint:point]) {
//        NSLog(@"in ------- blue");
//
//    }
//    point = [self.redLayer convertPoint:point fromLayer:self.blueLayer];
//    if ([self.redLayer containsPoint:point]) {
//        NSLog(@"in +++++++++ red");
//    }
//    
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.view.layer hitTest:point];
    if (layer == self.blueLayer) {
        NSLog(@"blue");
    } else if (layer == self.redLayer) {
        NSLog(@"red");
    }

}

@end
