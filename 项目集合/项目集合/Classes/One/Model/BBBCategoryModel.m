//
//  BBBCategoryModel.m
//  项目集合
//
//  Created by LinBin on 16/6/25.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBCategoryModel.h"

@implementation BBBCategoryModel

- (NSMutableArray *)allUserArray
{
    if (_allUserArray == nil) {
        _allUserArray = [NSMutableArray array];
    }
    return _allUserArray;
}

@end
