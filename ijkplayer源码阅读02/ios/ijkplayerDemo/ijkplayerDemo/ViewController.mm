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
@property (nonatomic, strong) IJKFFMoviePlayerController *player;
@end

@implementation ViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNotification];
    [self setupPlayer];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Setup
- (void)setupPlayer
{
    _player = [[IJKFFMoviePlayerController alloc] initWithContentURLString:@"rtmp://live.hkstv.hk.lxdns.com/live/hks" withOptions:nil];
    _player.scalingMode = IJKMPMovieScalingModeAspectFit;
    _player.view.frame = self.view.bounds;
    [self.view addSubview:_player.view];
    
    [_player prepareToPlay];
}

- (void)setupNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:IJKMPMovieNaturalSizeAvailableNotification object:nil];
    
}

#pragma mark - Notification
- (void)handleNotification:(NSNotification *)notification
{
    NSLog(@"naturalSize ====> %@", NSStringFromCGSize(_player.naturalSize));
    NSLog(@"currentPlaybackTime ====> %@", @(_player.currentPlaybackTime));
    NSLog(@"duration ====> %@", @(_player.duration));
    NSLog(@"playableDuration ====> %@", @(_player.playableDuration));
    NSLog(@"playbackRate ====> %@", @(_player.playbackRate));
    NSLog(@"playbackVolume ====> %@", @(_player.playbackVolume));
    
    NSLog(@"bufferingProgress ====> %@", @(_player.bufferingProgress));
    NSLog(@"numberOfBytesTransferred ====> %@", @(_player.numberOfBytesTransferred));
}


@end
