//
//  ViewController.m
//  ijkplayerDemo
//
//  Created by qinmin on 2017/6/6.
//  Copyright © 2017年 qinmin. All rights reserved.
//

#import "ViewController.h"
#import <IJKMediaFramework.h>

@interface ViewController ()
@property (nonatomic, strong) IJKMPMoviePlayerController *mpPlayer;
@property (nonatomic, strong) IJKAVMoviePlayerController *avPlayer;
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self setupAVPlayer];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Setup
- (void)setupMPPlayer
{
    _mpPlayer = [[IJKMPMoviePlayerController alloc] initWithContentURLString:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp4"]];
    _mpPlayer.scalingMode = IJKMPMovieScalingModeAspectFit;
    _mpPlayer.view.frame = self.view.bounds;
    [self.view addSubview:_mpPlayer.view];
    
    [_mpPlayer prepareToPlay];
}

- (void)setupAVPlayer
{
    _avPlayer = [[IJKAVMoviePlayerController alloc] initWithContentURLString:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"mp4"]];
    [self.view addSubview:_avPlayer.view];
    
    [_avPlayer setShouldAutoplay:YES];
    [_avPlayer prepareToPlay];
}



@end
