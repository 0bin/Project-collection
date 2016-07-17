//
//  BBBDrawBoardView.h
//  BBBQuart2D
//
//  Created by LinBin on 16/7/16.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBDrawBoardView : UIView

/** 线宽 */
@property (assign, nonatomic) NSInteger lineWidth;
/** 图片 */
@property (strong, nonatomic) UIImage *image;
/** 线条颜色 */
@property (strong, nonatomic) UIColor *lineColor;

/** 清屏 */
- (void)cleanAll;
/** 撤销 */
- (void)cancelLast;
@end
