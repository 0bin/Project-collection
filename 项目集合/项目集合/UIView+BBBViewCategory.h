//
//  UIView+BBBViewCategory.h
//  项目集合
//
//  Created by LinBin on 16/6/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (BBBViewCategory)



@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;



/** 从xib加载控件  */
+ (instancetype)initWithFromXib;

/**  当前在屏幕显示  */
- (BOOL)isShowingOnKeyWindow;




@end
