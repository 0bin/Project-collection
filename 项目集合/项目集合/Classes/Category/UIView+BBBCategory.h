//
//  UIView+BBBViewCategory.h
//  直接获取x、y、宽、高、
//  是否显示在屏幕
//  xib加载
#import <UIKit/UIKit.h>



@interface UIView (BBBCategory)


/**  宽  */
@property (nonatomic, assign) CGFloat width;
/**  高  */
@property (nonatomic, assign) CGFloat height;
/**  X  */
@property (nonatomic, assign) CGFloat x;
/**  Y  */
@property (nonatomic, assign) CGFloat y;
/**  size  */
@property (nonatomic, assign) CGSize  size;
/**  center.X  */
@property (nonatomic, assign) CGFloat centerX;
/**  center.Y   */
@property (nonatomic, assign) CGFloat centerY;



/** 从xib加载控件  */
+ (instancetype)initWithFromXib;

/**  当前在屏幕显示  */
- (BOOL)isShowingOnKeyWindow;




@end
