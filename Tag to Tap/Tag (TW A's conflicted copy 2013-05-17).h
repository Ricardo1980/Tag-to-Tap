//
//  Tag.h
//  Tag to Tap
//
//  Created by Tony Wael Abidi on 4/17/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface Tag : NSObject<AVAudioRecorderDelegate>

@property UIButton *tagButton;
@property UITextField *tagLabel;
@property NSURL *temporaryRecFiler;
@property AVAudioRecorder *recorder;

-(void)createTag:(UIViewController *)sender atLocation:(CGPoint)location;
-(void)setText:(NSString *)theText;
-(void)setVoice:(id)sender;

-(void)showButtonAndText:(UIViewController *)sender;
-(void)showButton:(UIViewController *)sender;
-(void)showText:(UIViewController *)sender;

@end
