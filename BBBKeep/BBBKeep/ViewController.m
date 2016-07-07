//
//  ViewController.m
//  BBBKeep
//
//  Created by LinBin on 16/7/6.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "ViewController.h"
#import "BBBAnimationView.h"

#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController()<AVPlayerViewControllerDelegate>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];


    NSURL *url = [[NSBundle mainBundle]URLForResource:@"keep.mp4" withExtension:nil];
    
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc] init];
    [playerVC setVideoGravity:@"AVLayerVideoGravityResizeAspectFill"];
    [playerVC setShowsPlaybackControls:NO];
    playerVC.player = [[AVPlayer alloc]initWithURL:url];
    playerVC.view.frame = [UIScreen mainScreen].bounds;
    [self addChildViewController:playerVC];
    [self.view addSubview:playerVC.view];
    [playerVC.player play];
    
    BBBAnimationView *animationView = [BBBAnimationView animationView];
    animationView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:animationView];
    

 
}



@end
