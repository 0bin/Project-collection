//
//  BBBCategoryModel.h
//  项目集合
//
//  Created by LinBin on 16/6/25.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBBCategoryModel : NSObject
/** id */
@property (nonatomic, assign) NSInteger id;
/** 总数 */
@property (nonatomic, assign) NSInteger count;
/** 名字 */
@property (nonatomic, copy) NSString *name;
@end
