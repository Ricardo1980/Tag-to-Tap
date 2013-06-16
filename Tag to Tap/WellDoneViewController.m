//
//  WellDoneViewController.m
//  Tag to Tap
//
//  Created by Student on 6/11/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "WellDoneViewController.h"

@interface WellDoneViewController ()

@end

@implementation WellDoneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImage *wellDone1 = [UIImage imageNamed:@"wellDone1.png"];
    UIImage *wellDone2 = [UIImage imageNamed:@"wellDone2.png"];
    UIImage *wellDone3 = [UIImage imageNamed:@"wellDone3.png"];
    UIImage *wellDone4 = [UIImage imageNamed:@"wellDone4.png"];
    UIImage *wellDone5 = [UIImage imageNamed:@"wellDone5.png"];
  
    NSArray *array = [[NSArray alloc] initWithObjects:wellDone1, wellDone2, wellDone3, wellDone4, wellDone5,nil];
    
    int r = arc4random() % [array count];
    if(r<[array count]){
        self.centerImage.image = [array objectAtIndex:r];
    }
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:@"applause"
                                         ofType:@"wav"]];
    
    NSError *error;
    _audioPlayer = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:url
                   error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
        [_audioPlayer play];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonTouched:(id)sender {
    [_audioPlayer stop];
}
@end
