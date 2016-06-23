//
//  AppDelegate.m
//  项目集合
//
//  Created by LinBin on 16/6/23.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "AppDelegate.h"
#import "BBBTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**  程序加载完成  */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    BBBTabBarController *tabBarC = [[BBBTabBarController alloc] init];
    self.window.rootViewController = tabBarC;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}
/**  程序中断 将变为不活跃状态  */
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//应用程序时将从活跃变为不活跃，可能发生某些类型的暂时中断(如电话来电或短信)或当用户退出应用程序开始转换到背景状态。/ /使用这种方法暂停正在进行的任务,禁用计时器,节流OpenGL ES帧率。游戏应该使用这个方法来暂停游戏。
}
/**  程序进入后台  */
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
/**  程序将要回到前台  */
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
/**  程序内存警告  */
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
/**  程序即将退出  */
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
