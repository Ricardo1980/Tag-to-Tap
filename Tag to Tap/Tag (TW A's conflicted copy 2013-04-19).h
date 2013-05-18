//
//  Tag.h
//  Tag to Tap
//
//  Created by Student on 4/12/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface Tag : NSObject <AVAudioRecorderDelegate>

@property (strong, nonatomic) UIButton *tagButton;
@property (strong, nonatomic) UITextField *tagText;
@property (strong, nonatomic) NSURL *temporaryRecFile;
@property (strong, nonatomic) AVAudioRecorder *recorder;

- (void)setText:(id)sender;
- (void)recordAudio:(id)sender;

@end
