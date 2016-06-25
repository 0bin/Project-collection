//
//  BBBCategoryCell.m
//  项目集合
//
//  Created by LinBin on 16/6/25.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBCategoryCell.h"
#import "BBBCategoryModel.h"

@interface BBBCategoryCell ()

@property (weak, nonatomic) IBOutlet UIView *indicatorView;

@end
@implementation BBBCategoryCell

- (void)setCategoryModel:(BBBCategoryModel *)categoryModel
{
    _categoryModel = categoryModel;
    self.textLabel.text = categoryModel.name;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layoutMargins = UIEdgeInsetsZero;
    self.separatorInset = UIEdgeInsetsZero;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.indicatorView.hidden = !selected;
    self.textLabel.textColor = selected ? [UIColor redColor] : [UIColor blackColor];
    // Configure the view for the selected state
}


@end
