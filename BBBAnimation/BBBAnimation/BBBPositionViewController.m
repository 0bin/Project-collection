//
//  BBBPositionViewController.m
//  BBBAnimation
//
//  Created by LinBin on 16/7/9.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBPositionViewController.h"

@interface BBBPositionViewController ()

@end

@implementation BBBPositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    UIView *red = [[UIView alloc] init];
    red.frame = CGRectMake(20, 84, 88, 88);
    red.backgroundColor = [UIColor redColor];
    [self.view addSubview:red];
    [UIView animateWithDuration:2.0 animations:^{
        red.frame = CGRectMake(260, 400, 88, 88) ;
        
    }];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
