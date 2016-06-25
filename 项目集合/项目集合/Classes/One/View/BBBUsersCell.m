//
//  BBBUsersCell.m
//  项目集合
//
//  Created by LinBin on 16/6/25.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import <UIImageView+WebCache.h>
#import "BBBUsersCell.h"
#import "BBBUserModel.h"


@interface BBBUsersCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fansLabel;

@end

@implementation BBBUsersCell

- (void)setModel:(BBBUserModel *)model
{
    _model = model;

    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.header]];
    self.nameLabel.text = model.screen_name;
    self.fansLabel.text= [NSString stringWithFormat:@"%ld人订阅",(long)model.fans_count];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
