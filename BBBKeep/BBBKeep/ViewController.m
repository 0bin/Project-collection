//
//  ViewController.m
//  BBBKeep
//
//  Created by LinBin on 16/7/6.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor redColor]];
    UILabel *label = [[UILabel alloc] init];
    [label setText:@"Home"];
    [label setFrame:CGRectMake(100, 200, 80, 80)];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
