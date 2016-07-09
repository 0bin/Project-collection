//
//  ViewController.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/9.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "ViewController.h"
#import "BBBQuartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BBBQuartView *view = [[BBBQuartView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    view.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:view];
}



@end
