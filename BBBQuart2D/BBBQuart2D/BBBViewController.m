//
//  BBBViewController.m
//  BBBQuart2D
//
//  Created by LinBin on 16/7/11.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBViewController.h"
#import "BBBQuart2DView.h"

@interface BBBViewController ()

@property (weak, nonatomic) BBBQuart2DView *quart;
@end

@implementation BBBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    BBBQuart2DView *quart = [[BBBQuart2DView alloc] init];
    [quart setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100)];
    [self.view addSubview:quart];
    self.quart = quart;
    [self addProgroessView];
    
    
}



- (void)addProgroessView
{
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = CGRectMake(100, self.view.bounds.size.height - 80, 100, 44);
    [slider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
        
}

- (void)sliderChange:(UISlider *)slider
{
    self.quart.progroessValue = slider.value;

}
@end
