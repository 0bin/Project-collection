//
//  BBBClockViewController.m
//  BBBLayer
//
//  Created by LinBin on 16/7/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBClockViewController.h"

@interface BBBClockViewController ()
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *hourView;
@property (weak, nonatomic) IBOutlet UIImageView *minView;
@property (weak, nonatomic) IBOutlet UIImageView *secView;

/**
 *  <#Description#>
 */
@property (weak, nonatomic) CALayer *hourLayer;
@property (weak, nonatomic) CALayer *minLayer;
@property (weak, nonatomic) CALayer *secLayer;

@end

@implementation BBBClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addLayer];
    
    self.backgroundView.layer.cornerRadius = self.backgroundView.bounds.size.width * 0.5;
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    self.hourView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    self.minView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    self.secView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    
}

- (void)timeChange
{
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *cmp = [calender components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    NSInteger second = cmp.second;
    CGFloat secondAngle = second * M_PI * 2 / 60;
    NSInteger minute = cmp.minute;
    CGFloat minuteAngle = minute * M_PI * 2 / 60;
    NSInteger hour = cmp.hour;
    CGFloat hourAngle = hour * M_PI * 2 / 12;
    
    self.hourView.transform = CGAffineTransformMakeRotation(hourAngle);
    self.minView.transform = CGAffineTransformMakeRotation(minuteAngle);
    self.secView.transform = CGAffineTransformMakeRotation(secondAngle);
}


- (void)addLayer
{
    CALayer *backLayer = [CALayer layer];
    backLayer.frame = CGRectMake(20, 80, 150,150);
    backLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    backLayer.cornerRadius = backLayer.bounds.size.width * 0.5;
    [self.view.layer addSublayer:backLayer];
    
    
    CALayer *hourLayer = [CALayer layer];
    hourLayer.backgroundColor = [UIColor greenColor].CGColor;
    hourLayer.anchorPoint = CGPointMake(0.5, 0.9);
    hourLayer.position = CGPointMake(backLayer.bounds.size.width * 0.5, backLayer.bounds.size.width * 0.5);
    hourLayer.bounds = CGRectMake(0, 0, 2, backLayer.bounds.size.width * 0.5 );
    [backLayer addSublayer:hourLayer];
    self.hourLayer = hourLayer;
    
    CALayer *minLayer = [CALayer layer];
    minLayer.backgroundColor = [UIColor blueColor].CGColor;
    minLayer.anchorPoint = CGPointMake(0.5, 0.9);
    minLayer.position = CGPointMake(backLayer.bounds.size.width * 0.5, backLayer.bounds.size.width * 0.5);
    minLayer.bounds = CGRectMake(0, 0, 2, backLayer.bounds.size.width * 0.5 - 10);
    [backLayer addSublayer:minLayer];
    self.minLayer = minLayer;
    
    CALayer *secLayer = [CALayer layer];
    secLayer.backgroundColor = [UIColor redColor].CGColor;
    secLayer.anchorPoint = CGPointMake(0.5, 0.9);
    secLayer.position = CGPointMake(backLayer.bounds.size.width * 0.5, backLayer.bounds.size.width * 0.5);
    secLayer.bounds = CGRectMake(0, 0, 2, backLayer.bounds.size.width * 0.5 - 20);
    [backLayer addSublayer:secLayer];
    self.secLayer = secLayer;
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(layerTimeChange) userInfo:nil repeats:YES];
}

- (void)layerTimeChange
{
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *cmp = [calender components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    NSInteger second = cmp.second;
    CGFloat secondAngle = second * M_PI * 2 / 60;
    NSInteger minute = cmp.minute;
    CGFloat minuteAngle = minute * M_PI * 2 / 60;
    NSInteger hour = cmp.hour;
    CGFloat hourAngle = hour * M_PI * 2 / 12;
    
    self.hourLayer.transform = CATransform3DMakeRotation(hourAngle, 0, 0, 1);
    self.minLayer.transform = CATransform3DMakeRotation(minuteAngle, 0, 0, 1);
    self.secLayer.transform = CATransform3DMakeRotation(secondAngle, 0, 0, 1);
}
@end
