//
//  BBBLockViewController.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/19.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBLockViewController.h"
#import "BBBLockView.h"

@interface BBBLockViewController ()

@end

@implementation BBBLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    self.view.backgroundColor = [UIColor grayColor];
    BBBLockView *lockView = [[BBBLockView alloc] init];
    [lockView setFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:lockView];
    
}




@end
