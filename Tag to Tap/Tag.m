//
//  Tag.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/17/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "Tag.h"
#import "TakePicController.h"
#import "EditPicViewController.h"
#import "StartTaggingViewController.h"
#import "StaticData.h"
#import "GuessWhatViewController.h"

int changeColor=0;

@implementation Tag
/*
 * Initialize function for a Tag, where an UIViewController, CGPoint and IDNumber(int) is neede as parameter.
 * Hierin worden alle buttons en label aangemaakt die een tag tot zijn beschikking heeft:
 * kader, tekst, opnemen, afspelen en delete
 */
-(void)createTag:(UIViewController *)sender atLocation:(CGPoint)location withIDNumber:(int)theID{
    
    _idNumber = theID;
    _available = YES;
    
    //Settings for tag Button:
    _tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _tagButton.frame = CGRectMake((location.x - 75), (location.y - 50), 150, 100);
    [[_tagButton layer] setCornerRadius:5.0f];
    [[_tagButton layer] setBorderWidth:2.5f];
    [[_tagButton layer] setBorderColor:[UIColor colorWithRed:(250/255.f) green:(250/255.f) blue:(250/255.f) alpha:1.0].CGColor];
    [_tagButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //setttings record button
    _recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _recordButton.frame = CGRectMake((location.x - 30) ,(location.y - 85) , 32, 32);
    [_recordButton setBackgroundImage: [UIImage imageNamed:@"recordButton2.png"] forState:UIControlStateNormal];
    [_recordButton addTarget:self action:@selector(recordClicked:) forControlEvents:UIControlEventTouchUpInside];
    //settings play button
    _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _playButton.frame = CGRectMake((location.x + 5) ,(location.y - 85) , 32, 33);
    [_playButton setBackgroundImage: [UIImage imageNamed:@"playButtonRec.png"] forState:UIControlStateNormal];
    [_playButton addTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
    //settings stop button
    _stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //_stopButton.frame = CGRectMake((location.x + 40) ,(location.y - 85) , 32, 33);
    _stopButton.frame = CGRectMake((location.x - 30) ,(location.y - 85) , 32, 32);
    [_stopButton setBackgroundImage: [UIImage imageNamed:@"recordButton.png"] forState:UIControlStateNormal];
    [_stopButton addTarget:self action:@selector(stopClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //Settings voor deleteButton
    _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteButton.frame = CGRectMake((location.x - 85) ,(location.y - 70) , 32, 33);
    [_deleteButton setBackgroundImage: [UIImage imageNamed:@"no?Button"] forState:UIControlStateNormal];
    [_deleteButton addTarget:self action:@selector(deleteTag:) forControlEvents:UIControlEventTouchUpInside];
    
    //settings for the recorder
    _playButton.enabled = NO;
    //_stopButton.enabled = NO;
    _stopButton.alpha = 0;
    NSArray *dirPaths;
    NSString *docsDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent: [NSString stringWithFormat:@"sound%i.caf" , _idNumber]];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    NSDictionary *recordSettings = [NSDictionary
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16],
                                    AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2],
                                    AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0],
                                    AVSampleRateKey,
                                    nil];
    NSError *error = nil;
    _recorder = [[AVAudioRecorder alloc]
                 initWithURL:soundFileURL
                 settings:recordSettings
                 error:&error];
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        [_recorder prepareToRecord];
    }

    //Settings for the label:
    _tagLabel = [[UITextField alloc] initWithFrame:CGRectMake((location.x - 100), (location.y+50), 200, 20)];
    [_tagLabel addTarget:self action:@selector(labelClicked:) forControlEvents:UIControlEventTouchDown];
    [_tagLabel becomeFirstResponder];
    [_tagLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:16]];
    [_tagLabel setText:@"Click here to change text"];
    [_tagLabel setTextAlignment:NSTextAlignmentCenter];
    [_tagLabel setBackgroundColor:[UIColor clearColor]];
    [_tagLabel setTextColor:[UIColor colorWithRed:(250/255.f) green:(250/255.f) blue:(250/255.f) alpha:1.0]];
    [sender.view addSubview:_tagLabel];
    
    
}

-(void)setText:(NSString *)theText{
    _tagLabel.text = theText;
}

-(void)recordClicked:(id)sender{
    if (!_recorder.recording)
    {
        if(_player.playing){
            [_player stop];
        }
        NSLog(@"in the if of record clicked");
        _playButton.enabled = NO;
        //_stopButton.enabled = YES;
        _stopButton.alpha = 1;
        [_recorder record];
    }
}

-(void)stopClicked:(id)sender{
    //_stopButton.enabled = NO;
    _stopButton.alpha = 0;
    _playButton.enabled = YES;
    _recordButton.enabled = YES;
    
    if (_recorder.recording)
    {
        NSLog(@"in the if stopclicked ");
        [_recorder stop];
    } else if (_player.playing) {
        NSLog(@"in the else of stopclicked");
        [_player stop];
    }
    
}

/*
 * If the current target of the button = playClicked, then the following function will be executed.
 * It checks (through the StaticData) if you are currently playing the GuessWhat game.
 */
-(void)playClicked:(id)sender{
    StaticData *_dataSource = [[StaticData alloc]init];
    _dataSource.selectedTag = self;
    
    if(!_dataSource.guessWhatGameMode)
    {
        if (!_recorder.recording)
        {
            //_stopButton.enabled = YES;
            _stopButton.alpha = 0;
            //_recordButton.enabled = NO;
            NSError *error = nil;
            
            _player = [[AVAudioPlayer alloc]
                       initWithContentsOfURL:_recorder.url
                       error:nil];
            
            _player.delegate = self;
            
            if (error){
                NSLog(@"Error: %@",
                      [error localizedDescription]);
            }else{
                [_player play];
            }
        }
        [_tagLabel setHidden:NO];
    }
    else if(_dataSource.guessWhatGameMode){
        NSString *noWhiteSpacesText = [_tagLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"DataSource Text: %@", _dataSource.GuessGameText);
        NSLog(@"tagLabel Text: %@", _tagLabel.text);
        NSLog(@"tagLabel noWhiteSpace Text: %@", noWhiteSpacesText);
        if([_dataSource.GuessGameText isEqualToString:noWhiteSpacesText]){
            [_tagLabel setHidden:NO];
            _dataSource.updateGuessWhatGame = YES;
        }
        else{
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                 pathForResource:@"wrong"
                                                 ofType:@"wav"]];
            
            NSError *error;
            _wrongTagSoundPlayer = [[AVAudioPlayer alloc]
                            initWithContentsOfURL:url
                            error:&error];
            if (error)
            {
                NSLog(@"Error in wrongTagSoundPlayer: %@",
                      [error localizedDescription]);
            } else {
                _wrongTagSoundPlayer.delegate = self;
                [_wrongTagSoundPlayer prepareToPlay];
                [_wrongTagSoundPlayer play];
            }
        }
    }
    
    
}

/*
 * Used in the GuessWhat viewController.
 */
-(void)playRecording{
    if (!_recorder.recording)
    {
        //_stopButton.enabled = YES;
        _stopButton.alpha = 1;
        _recordButton.enabled = NO;
        NSError *error = nil;
        
        _player = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:_recorder.url
                   error:nil];
        
        _player.delegate = self;
        
        if (error){
            NSLog(@"Error: %@",
                  [error localizedDescription]);
        }else{
            [_player play];
        }
    }
}

/*
 * If the current target of the button = buttonClicked, then the following function will be executed
 */
-(void)buttonClicked:(id)sender{
    
    StaticData *_dataSource = [[StaticData alloc]init];
    _dataSource.selectedTag = self;
    
    if(changeColor == 0){
        [[_tagButton layer] setBorderColor:[UIColor colorWithRed:(1/255.f) green:(1/255.f) blue:(1/255.f) alpha:1.0].CGColor];
        [_tagLabel setTextColor:[UIColor colorWithRed:(1/255.f) green:(1/255.f) blue:(1/255.f) alpha:1.0]];
        changeColor++;
    }
    else if(changeColor == 1){
        [[_tagButton layer] setBorderColor:[UIColor colorWithRed:(250/255.f) green:(250/255.f) blue:(250/255.f) alpha:1.0].CGColor];
        [_tagLabel setTextColor:[UIColor colorWithRed:(250/255.f) green:(250/255.f) blue:(250/255.f) alpha:1.0]];
        changeColor--;
    }
}

-(void)labelClicked:(id)sender{
    StaticData *_dataSource = [[StaticData alloc]init];
    _dataSource.selectedTag = self;
    
    [_tagLabel selectAll:self];
}


/*
 * A 'delete' function.
 * This removes all buttons, texts and targets of a Tag
 */
-(void)deleteTag:(id)sender{
    _available = NO;
    
    [_tagButton removeTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_tagButton removeTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_tagButton setHidden:YES];
    
    _tagLabel.enabled = NO;
    [_tagLabel setHidden:YES];
    
    [_recordButton removeTarget:self action:@selector(recordClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_recordButton setHidden:YES];
    [_playButton removeTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_playButton setHidden:YES];
    [_stopButton removeTarget:self action:@selector(stopClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_stopButton setHidden:YES];
    
    [_deleteButton removeTarget:self action:@selector(deleteTag:) forControlEvents:UIControlEventTouchUpInside];
    [_deleteButton setHidden:YES];
    
}


/*
 * Below you will find serveral 'show...' functions.
 * Each function tells the app what buttons/texts have to be shown in the current viewController.
 */
-(void)showAll:(UIViewController *)sender{
    [sender.view addSubview:_tagButton];
    [sender.view addSubview:_tagLabel];
    [sender.view addSubview:_recordButton];
    [sender.view addSubview:_playButton];
    [sender.view addSubview:_stopButton];
    [sender.view addSubview:_deleteButton];
    StaticData *_dataSource = [[StaticData alloc]init];
    
    if(!_dataSource.inEditMode){
        [_tagButton removeTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_tagButton addTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
        _tagLabel.enabled = NO;
    }
    else if(_dataSource.inEditMode){
       [_tagButton removeTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_tagButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
      _tagLabel.enabled = YES;
    }
}

-(void)showButtonAndText:(UIViewController *)sender{
    StaticData *_dataSource = [[StaticData alloc]init];
    
    [sender.view addSubview:_tagButton];
    [sender.view addSubview:_tagLabel];
    [_tagLabel setHidden:YES];
    if(!_dataSource.inEditMode){
        [_tagButton removeTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_tagButton addTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
        _tagLabel.enabled = NO;
    }
   else if(_dataSource.inEditMode){
       [_tagButton removeTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
       [_tagButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
       _tagLabel.enabled = YES;
   }
    
}

-(void)showButton:(UIViewController *)sender{
    StaticData *_dataSource = [[StaticData alloc]init];
    [sender.view addSubview:_tagButton];
    [_tagLabel setHidden:YES];
    if(!_dataSource.inEditMode){
        [_tagButton removeTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_tagButton addTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
        _tagLabel.enabled = NO;
    }
    else if(_dataSource.inEditMode){
        [_tagButton removeTarget:self action:@selector(playClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_tagButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        _tagLabel.enabled = YES;
    }
    
}

-(void)showText:(UIViewController *)sender{
    [sender.view addSubview:_tagLabel];
}

@end
