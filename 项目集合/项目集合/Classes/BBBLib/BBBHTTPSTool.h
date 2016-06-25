//
//  BBBHTTPSTool.h
//  项目集合
//
//  Created by LinBin on 16/6/24.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBBHTTPSTool : NSObject
/**
 *  单例
 */
+ (instancetype)shareTool;

/**
 *  get请求
 */
- (void)GET:(NSString *)URL parameters:(id)parameters succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

/**
 *  post请求
 */
- (void)Post:(NSString *)URLString parameters:(id)parameters succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;
@end
