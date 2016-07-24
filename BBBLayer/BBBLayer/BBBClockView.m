//
//  BBBClockView.m
//  BBBLayer
//
//  Created by LinBin on 16/7/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBClockView.h"

@implementation BBBClockView


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    CGContextStrokeEllipseInRect(context, CGRectMake(100, 100, 200, 200));
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);

}


@end
