//
//  BBBLoginController.m
//  BBBProject
//
//  Created by LinBin on 16/7/5.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBLoginController.h"
#import <AVFoundation/AVFoundation.h>


@interface BBBLoginController ()


@end

@implementation BBBLoginController







- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"keep.mp4" withExtension:nil];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    layer.frame = [UIScreen mainScreen].bounds;
    [self.view.layer addSublayer:layer];
    [player play];
    

}




@end
