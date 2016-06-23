//
//  UIBarButtonItem+BBBCategory.m
//  项目集合
//
//  Created by LinBin on 16/6/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "UIBarButtonItem+BBBCategory.h"

@implementation UIBarButtonItem (BBBCategory)


+ (UIBarButtonItem *) itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action
{
    UIButton *Button = [[UIButton alloc] init];
    [Button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [Button setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [Button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [Button setFrame:CGRectMake(0, 0, Button.currentBackgroundImage.size.width, Button.currentBackgroundImage.size.height)];
    
    return [[UIBarButtonItem alloc] initWithCustomView:Button];
}
@end
