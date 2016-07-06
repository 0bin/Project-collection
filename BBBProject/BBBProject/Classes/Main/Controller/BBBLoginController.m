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
//    ///MPMoviePlayerViewController 播放带工具栏，需要在viewDidAppear内使用，<MediaPlayer/MediaPlayer.h>
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"keep.mp4" withExtension:nil];
//    MPMoviePlayerViewController *playerVC = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    
   
//    [self presentMoviePlayerViewControllerAnimated:playerVC];
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
    

 
    
///9.0 后弃用，MPMoviePlayerController 播放带工具栏，需要在viewDidAppear内使用，<MediaPlayer/MediaPlayer.h>，需要强引用
//@property (strong, nonatomic) MPMoviePlayerController *playerController;
//    - (MPMoviePlayerController *)playerController
//    {
//        if (_playerController == nil) {
//            NSURL *url = [[NSBundle mainBundle] URLForResource:@"keep.mp4" withExtension:nil];
//            _playerController = [[MPMoviePlayerController alloc] initWithContentURL:url];
//            _playerController.view.frame = [UIScreen mainScreen].bounds;
//            // 指定加载类型，会提高播放效率
//            [_playerController setMovieSourceType:MPMovieSourceTypeFile];
//            // 全屏
//            [_playerController setFullscreen:YES];
//            // 重复
//            [_playerController setRepeatMode:MPMovieRepeatModeOne];
//            // 取消工具栏
//            [_playerController setControlStyle:MPMovieControlStyleNone];
//            
//            [self.window addSubview:_playerController.view];
//            
//            
//            
//        }
//        return _playerController;
//    }
//        [self.playerController play];
    
    
    
    
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
