//
//  BBBLoginController.m
//  BBBProject
//
//  Created by LinBin on 16/7/5.
//  Copyright © 2016年 LinBin. All rights reserved.
//

#import "BBBLoginController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface BBBLoginController ()

@end

@implementation BBBLoginController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"keep.mp4" withExtension:nil];
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    [player setRepeatMode:MPMovieRepeatModeOne];
//    [player setFullscreen:YES animated:YES];
    player.controlStyle = MPMovieControlStyleNone;
    player.view.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:player.view];
    
    [player play];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
///AVFoundation 播放  有白边<AVFondation>
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"keep.mp4" withExtension:nil];
//    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
//    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
//    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
//    layer.frame = [UIScreen mainScreen].bounds;
//    [self.view.layer addSublayer:layer];
//    [player play];
    
///MPMoviePlayerViewController 播放 带控制按钮，需要在viewDidAppear内使用，<MediaPlayer/MediaPlayer.h>
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"keep.mp4" withExtension:nil];
//    MPMoviePlayerViewController *playerVC = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
//    [self presentMoviePlayerViewControllerAnimated:playerVC];
    

    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
