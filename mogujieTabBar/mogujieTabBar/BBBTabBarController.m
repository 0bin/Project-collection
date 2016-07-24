//
//  BBBTabBarController.m
//  mogujieTabBar
//
//  Created by LinBin on 16/7/8.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBTabBarController.h"
#import "BBBViewController.h"
#import "BBBNavigationController.h"
#import "BBBAddController.h"


@interface BBBTabBarController ()<UITabBarDelegate>

@property (strong, nonatomic) UIButton *addButton;

@end

@implementation BBBTabBarController



- (UIButton *)addButton
{
    if (_addButton == nil) {
        _addButton = [[UIButton alloc]init];
    }
    return _addButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BBBViewController *one = [[BBBViewController alloc] init];
    [self addTabBarChildVC:one Image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"one"];
    
    BBBViewController *two = [[BBBViewController alloc] init];
    [self addTabBarChildVC:two Image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"two"];
    
    BBBViewController *three = [[BBBViewController alloc] init];
    [self addTabBarChildVC:three Image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"three"];
    
    BBBViewController *four = [[BBBViewController alloc] init];
    [self addTabBarChildVC:four Image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"four"];
    
    BBBViewController *five = [[BBBViewController alloc] init];
    [self addTabBarChildVC:five Image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted" title:@"five"];
  
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [self.addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    
    CGFloat width = self.addButton.currentBackgroundImage.size.width;
    CGFloat height = self.tabBar.bounds.size.height;
    CGFloat centerX = self.tabBar.bounds.size.width * 0.5;
    CGFloat centerY = self.tabBar.bounds.size.height * 0.5;
    
    self.addButton.frame = CGRectMake(0, 0, width, height);
    self.addButton.center = CGPointMake(centerX, centerY);
    [self.addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:self.addButton];
    


}




- (void)addButtonClick
{
    BBBAddController *addVC = [[BBBAddController alloc] init];
    [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController pushViewController:addVC animated:YES];
    [self presentViewController:addVC animated:YES completion:nil];

}


/**
 *  添加tabbar子控制器
 *    if (item.tag == 10) {
  }
 *  @param childVC       传入控制器
 *  @param image         图片
 *  @param selectedImage 选中图片
 *  @param title         标题
 */
- (void)addTabBarChildVC:(UIViewController *)childVC Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.title = title;
    BBBNavigationController *nav = [[BBBNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"---%@---",item.title);
    self.addButton.hidden = ![item.title isEqualToString:@"three"];
    
    if (![item.title isEqualToString:@"three"]) {
        self.addButton.hidden;
    }
    
    
    //    CGFloat width = self.addButton.currentBackgroundImage.size.width;
    //    CGFloat height = self.tabBar.bounds.size.height;
    //    CGFloat centerX = self.tabBar.bounds.size.width * 0.5;
    //    CGFloat centerY = self.tabBar.bounds.size.height * 0.5;
//    if (![item.title isEqualToString:@"three"]) {
//        [UIView animateWithDuration:1.0 animations:^{
//            CGRect frame = self.addButton.frame;
//            frame.size.width = 1;
//            frame.size.height = 1;
//            self.addButton.frame = frame;
//            self.addButton.center = CGPointMake(centerX, centerY);
//        }completion:^(BOOL finished) {
//            self.addButton.hidden = YES;
//            self.addButton.frame = CGRectMake(0, 0, width, height);
//            self.addButton.center = CGPointMake(centerX, centerY);
//        }];
//
//    }

}


@end
