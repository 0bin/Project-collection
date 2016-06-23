//
//  BBBTabBar.m
//  项目集合
//
//  Created by LinBin on 16/6/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBTabBar.h"



@interface BBBTabBar ()

@property (weak, nonatomic) UIButton *addButton;

@end




@implementation BBBTabBar

/**
 *  设置addButton
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton *addButton = [[UIButton alloc] init];
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        [addButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [addButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:addButton];
        self.addButton = addButton;
    }
    return self;
}

/**
 *  addButton点击
 */
- (void)addButtonClick
{
//    
//    BSPublishViewController *pulish = [[BSPublishViewController alloc] init];
//    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:pulish animated:NO completion:nil];
}


/**
 *  计算tabbar内item的位置
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.addButton setFrame:CGRectMake(0, 0, self.addButton.currentImage.size.width, self.addButton.currentImage.size.height)];
    [self.addButton setCenter:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5)];
    CGFloat buttonW = self.bounds.size.width * 0.2;
    CGFloat buttonH = self.bounds.size.height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        CGFloat buttonX = (index > 1 ? index + 1 : index) * buttonW;
        [button setFrame:CGRectMake(buttonX, 0, buttonW, buttonH)];
        index++;
    }
}

@end
