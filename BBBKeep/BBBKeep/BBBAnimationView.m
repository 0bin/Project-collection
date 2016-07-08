//
//  BBBAnimationView.m
//  BBBKeep
//
//  Created by LinBin on 16/7/7.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBAnimationView.h"

@interface BBBAnimationView ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation BBBAnimationView


+ (instancetype)animationView
{
    return [[NSBundle mainBundle]loadNibNamed:@"BBBAnimationView" owner:nil options:nil].lastObject;

}

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    [self addLabel];
    
    

}

- (void)addLabel
{
    NSArray *array = @[@"全程记录你的健身数据",@"规范你的训练过程",@"陪伴你迈出跑步的第一步",@"分享汗水后你的性感"];
    
    CGFloat labelW = self.scrollView.frame.size.width;
    CGFloat labelH = self.scrollView.frame.size.height;
    CGFloat labelY = 0;
    
    for (NSInteger i = 0; i < array.count; i++) {
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(labelW * i, labelY, labelW, labelH);
        label.text = array[i];
        label.textColor = [UIColor whiteColor];
        [label setTextAlignment:NSTextAlignmentCenter];
        [self.scrollView addSubview:label];
        
        
    }
    
    [self.scrollView setContentSize:CGSizeMake(labelW * array.count, 0)];
    [self.scrollView setPagingEnabled:YES];
   

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
