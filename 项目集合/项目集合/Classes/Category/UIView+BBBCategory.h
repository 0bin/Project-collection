//
//  UIView+BBBViewCategory.h
//  直接获取x、y、宽、高、
//  是否显示在屏幕
//  xib加载
#import <UIKit/UIKit.h>



@interface UIView (BBBCategory)



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
