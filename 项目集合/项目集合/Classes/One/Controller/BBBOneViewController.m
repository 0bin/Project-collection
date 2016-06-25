//
//  BBBOneViewController.m
//  项目集合
//
//  Created by LinBin on 16/6/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBOneViewController.h"
#import "UIBarButtonItem+BBBCategory.h"
#import "BBBContentTableController.h"
#import "BBBTwoTableController.h"

@interface BBBOneViewController () <UIScrollViewDelegate>

/** 内容导航栏scroll */
@property (weak, nonatomic) UIScrollView *titleScroll;
/** 内容scroll */
@property (weak, nonatomic) UIScrollView *contentScroll;
/** 导航栏选中指示view */
@property (weak, nonatomic) UIView *indicatorView;
/** 导航栏选中button */
@property (strong, nonatomic) UIButton *selelctorButton;
/** 内容view */
@property (weak, nonatomic) UIView *contentView;

@end

@implementation BBBOneViewController

//子视图个数
static const NSUInteger childViewCount = 7;

- (void)viewDidLoad
{
    [self setNavigationView];
    [self addContentScrollView];
    [self contentScrolladdChildVC];
    [self addTitleScrollView];

}


/**
 *   内容视图容器Content scroll
 */
- (void)addContentScrollView {
    
    UIScrollView *contentScroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [contentScroll setBackgroundColor:[UIColor whiteColor]];
    [contentScroll setContentSize:CGSizeMake(childViewCount * self.view.width, 0)];
    [contentScroll setPagingEnabled:YES];
    [self.view addSubview:contentScroll];
    self.contentScroll = contentScroll;
    [self.contentScroll setDelegate:self];
}

/**
 *   往容器内添加控制器
 */
- (void)contentScrolladdChildVC
{
    
    BBBContentTableController *allTable = [[BBBContentTableController alloc] init];
    [allTable setTitle:@"全部"];
    allTable.type = BSBasicTypeAll;
    [self addChildViewController:allTable];
    
    BBBContentTableController *text = [[BBBContentTableController alloc] init];
    [text setTitle:@"段子"];
    text.type = BSBasicTypeText;
    [self addChildViewController:text];
    
    
    BBBContentTableController *picture = [[BBBContentTableController alloc] init];
    [picture setTitle:@"图片"];
    picture.type = BSBasicTypePicture;
    [self addChildViewController:picture];
    
    BBBContentTableController *voice = [[BBBContentTableController alloc] init];
    [voice setTitle:@"声音"];
    voice.type = BSBasicTypeVoice;
    [self addChildViewController:voice];
    
    BBBContentTableController *vedio = [[BBBContentTableController alloc] init];
    [vedio setTitle:@"视频"];
    vedio.type = BSBasicTypeVedio;
    [self addChildViewController:vedio];
    
    BBBContentTableController *six = [[BBBContentTableController alloc] init];
    six.type = BSBasicTypeAll;
    [six setTitle:@"排行"];
    [self addChildViewController:six];
    
    BBBContentTableController *seven = [[BBBContentTableController alloc] init];
    [seven setTitle:@"其他"];
    seven.type = BSBasicTypeAll;
    [self addChildViewController:seven];
    
}

/**
 *  添加头部滚动视图title scroll
 */
- (void)addTitleScrollView
{
    static const CGFloat scrollH = 36;
    static const CGFloat scrollY = 64;
    static const CGFloat titleW = 80;
    static const NSUInteger childViewCount = 7;
    //添加titleScroll
    UIScrollView *titleScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, scrollY,BBBScreenWidth, scrollH)];
    titleScroll.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    [titleScroll setContentSize:CGSizeMake(childViewCount * titleW, 0)];
    [titleScroll setBounces:NO];
    [self.view addSubview:titleScroll];
    self.titleScroll = titleScroll;
    
    //添加button
    for (NSInteger i = 0; i < childViewCount; i++)
        {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * titleW, 0, titleW, scrollH)];
            [button setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
            [button.titleLabel sizeToFit];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
            [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
            [button addTarget:self action:@selector(titleScrollButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i;
            [titleScroll addSubview:button];
        }
    
    //添加button底部红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    [indicatorView setBackgroundColor:[UIColor redColor]];
    indicatorView.height = 3;
    indicatorView.y = self.titleScroll.height - 3;
    [titleScroll addSubview:indicatorView];
    self.indicatorView = indicatorView;
    [self titleScrollButtonClick:self.titleScroll.subviews.firstObject];
    
}

/**
 *  titleScroll 内的button点击
 */
- (void)titleScrollButtonClick:(UIButton *)button {
    
    self.selelctorButton.enabled = YES;
    button.enabled = NO;
    self.selelctorButton = button;
    
    //点击titlescroll的button 跳转到对象的内容
    CGFloat offsetX = button.tag * self.contentScroll.width;
    [self.contentScroll setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.indicatorView.width = self.selelctorButton.titleLabel.width;
        self.indicatorView.centerX = self.selelctorButton.centerX;
    }];
    
}


/**
 *  设置导航栏细节
 */
- (void)setNavigationView
{
    [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]]];
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick" target:self action:@selector(leftButtonClick)];
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick" target:self action:@selector(rightButtonClick:)];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    [self.navigationItem setRightBarButtonItem:rightItem];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
}

/**
 *  设置导航左侧按钮点击
 */
- (void)leftButtonClick {
    
    BBBTwoTableController *twoTable = [[BBBTwoTableController alloc] init];
    [self.navigationController pushViewController:twoTable animated:YES];
}

/**
 *  设置导航右侧按钮点击
 */
- (void)rightButtonClick:(UIView *)item {
    
//    LBPopoverView *popover = [LBPopoverView popoverView];
//    
//    [popover showPopoverViewFrom:item];
    
}

#pragma mark - UIScrollViewDelegate
/**
 *  点击移动动画停止调用
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    
    //添加控制器对应的视图
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    //设置button点击居中
    UIButton *button = self.titleScroll.subviews[index];
    CGFloat buttonX = button.centerX - scrollView.width * 0.5;
    if (buttonX < 0 ) {
        buttonX = 0;
    }
    
    if (buttonX > self.titleScroll.contentSize.width - scrollView.width) {
        buttonX = self.titleScroll.contentSize.width - scrollView.width;
    }
    [self.titleScroll setContentOffset:CGPointMake(buttonX,0) animated:YES];
    
    BBBContentTableController *all = self.childViewControllers[index];
    if ([all isViewLoaded]) return;
    [all.view setFrame:CGRectMake(scrollView.contentOffset.x, 0, scrollView.width, scrollView.height)];
    [all.tableView setContentInset:UIEdgeInsetsMake(CGRectGetMaxY(self.titleScroll.frame), 0, self.tabBarController.tabBar.height, 0)];
    [self.contentScroll addSubview:all.view];
    
}

/**
 *  手势拖动停止调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleScrollButtonClick:self.titleScroll.subviews[index]];
    
}
@end
