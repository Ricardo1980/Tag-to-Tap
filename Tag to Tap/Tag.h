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

@interface Tag : NSObject<AVAudioRecorderDelegate ,AVAudioPlayerDelegate >{
    
    
    BOOL isNotRecording;
}
@property UIButton *playButton;
@property UIButton *stopButton;
@property UIButton *tagButton;
@property UIButton *recordButton;
@property UITextField *tagLabel;
@property NSURL *temporaryRecFile;
@property AVAudioRecorder *recorder;
@property AVAudioPlayer *player;
@property int idNumber;


-(void)createTag:(UIViewController *)sender atLocation:(CGPoint)location withIDNumber:(int)theID;
-(void)setText:(NSString *)theText;
-(void)setVoice:(id)sender;
-(void)showAll:(UIViewController *)sender;
-(void)showButtonAndText:(UIViewController *)sender;
-(void)showButton:(UIViewController *)sender;
-(void)showText:(UIViewController *)sender;

@end
