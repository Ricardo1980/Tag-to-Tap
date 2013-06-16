//
//  WellDoneViewController.h
//  Tag to Tap
//
//  Created by Student on 6/11/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface WellDoneViewController : UIViewController<AVAudioPlayerDelegate >

@property (strong, nonatomic) IBOutlet UIImageView *centerImage;
@property AVAudioPlayer *audioPlayer;

- (IBAction)backButtonTouched:(id)sender;
@end
