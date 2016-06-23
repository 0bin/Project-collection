//
//  BBBTabBarController.m
//  项目集合
//
//  Created by LinBin on 16/6/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBTabBarController.h"
#import "BBBNavigationController.h"
#import "BBBOneViewController.h"
#import "BBBTwoViewController.h"
#import "BBBThreeViewController.h"
#import "BBBFourViewController.h"
#import "BBBTabBar.h"

@interface BBBTabBarController ()

@end

@implementation BBBTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTabBarItemAppearance];
    
    BBBOneViewController *one = [[BBBOneViewController alloc] init];
    [self addTabBarChildVC:one Image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" title:@"one"];
    
    BBBTwoViewController *two = [[BBBTwoViewController alloc] init];
    [self addTabBarChildVC:two Image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" title:@"two"];
    
    BBBThreeViewController *three = [[BBBThreeViewController alloc] init];
    [self addTabBarChildVC:three Image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" title:@"three"];
    
    BBBFourViewController *four = [[BBBFourViewController alloc] init];
    [self addTabBarChildVC:four Image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" title:@"four"];
    
    //通过kvc替换系统tabbar
    BBBTabBar *tabBar = [[BBBTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    
    
}

/**
 *  添加tabbar子控制器
 *
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

/**
 *  统一设置TabBarItem文字样式
 */
- (void)setTabBarItemAppearance {
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectedAttributes = [NSMutableDictionary dictionary];
    selectedAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    
}

@end
