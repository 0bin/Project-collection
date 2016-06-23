//
//  UIBarButtonItem+BBBCategory.h
//  项目集合
//
//  Created by LinBin on 16/6/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BBBCategory)

/**
 *  将button封装成UIBarButtonItem
 *
 *  @param image          图片名
 *  @param highlightImage 高亮图片
 *  @param target         self
 *  @param action         SEL
 *
 *  @return UIBarButtonItem
 */
+ (UIBarButtonItem *) itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(id)target action:(SEL)action;

@end
