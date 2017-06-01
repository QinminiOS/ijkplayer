//
//  ViewController.m
//  ijkplayer源码阅读01
//
//  Created by qinmin on 2017/6/1.
//  Copyright © 2017年 qinmin. All rights reserved.
//

#import "ViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface ViewController ()
{
    IJKFFMoviePlayerController *_moviePlayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _moviePlayer = [[IJKFFMoviePlayerController alloc] initWithContentURLString:@"http://zv.3gv.ifeng.com/live/zixun800k.m3u8" withOptions:[IJKFFOptions optionsByDefault]];
    [_moviePlayer setScalingMode:IJKMPMovieScalingModeAspectFit];
    
    UIView *playerView = _moviePlayer.view;
    playerView.bounds = self.view.bounds;
    [self.view addSubview:playerView];
    
    [_moviePlayer prepareToPlay];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
