//
//  GuessWhatViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 5/20/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "GuessWhatViewController.h"

@interface GuessWhatViewController ()

@end

@implementation GuessWhatViewController

- (id)initWithTaggedImage:(TaggedImage *)theTaggedImage
{
    self = [super init];
    if (self) {
        _taggedImage = theTaggedImage;
    }
    return self;
}

/*
 * When this viewController is the current one, the function below will be executed.
 * Here we initiate several things like: showing the right tag-settings and timer.
 */
- (void)viewDidLoad
{
    _dataSource = [[StaticData alloc]init];
    _dataSource.inEditMode = NO;
    _dataSource.guessWhatGameMode = YES;
    _availableTags = [[NSMutableArray alloc]init];
    
    
    
    /*
     * Below all the available tags of this TaggedImage will be put inside a new array, used by this viewController.
     */
    [self.imageView setImage:_taggedImage.image];
    for(int i=0; i<_taggedImage.tags.count; i++){
        Tag *helpTag = [[Tag alloc]init];
        helpTag = [_taggedImage.tags objectAtIndex:i];
        [helpTag showButtonAndText:self];
        if(helpTag.available)
        {
            NSLog(@"added helptag nummer:  %i", i);
            [_availableTags addObject:helpTag];
        }
    }
    
    [self getTextToGuess];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    _updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.033f target:self
                                                  selector:@selector(mainLoop:) userInfo:nil repeats:NO];
    
}

/*
 * When this viewController is going to close, the function below will be executed.
 * We make sure that all the timers will be nil and invalidated to prevent crashes. 
 */
- (void)viewWillDisappear:(BOOL)animated {
    if(_updateTimer)
    {
        [_updateTimer invalidate];
        _updateTimer = nil;
    }

    if(_waitTimer)
    {
        [_waitTimer invalidate];
        _waitTimer = nil;
    }
}

/*
 * Update function that looks inside the StaticData if it needs to update the text to guess
 * To set the timer again, it will loop itself untill the timer is invalidated 
 */
- (void) mainLoop: (id) sender
{
    if(_dataSource.updateGuessWhatGame){
        _dataSource.updateGuessWhatGame = NO;
        [self getTextToGuess];
    }
    
    _updateTimer = [NSTimer scheduledTimerWithTimeInterval:0.033f target:self
                                   selector:@selector(mainLoop:) userInfo:nil repeats:NO];
    
    
}

/*
 * This function will go through all the available tags of the current TaggedImage. 
 * It picks randomly a new one to guess.
 */
-(void)getTextToGuess{
    if([_availableTags count] > 0)
    {
        Tag *tagToGuess;
        int r = arc4random() % [_availableTags count];
        if(r<[_availableTags count]){
            tagToGuess=[_availableTags objectAtIndex:r];
        }
        NSString *noWhiteSpacesText = [tagToGuess.tagLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        _dataSource.GuessGameText = noWhiteSpacesText;
        _TextToGuesslabel.text = tagToGuess.tagLabel.text;
        [tagToGuess playRecording];
        [_availableTags removeObjectAtIndex:r];
    }
    else{
        _dataSource.GuessGameText = @"Well Done!";
        _TextToGuesslabel.text = @"Well Done!";
        _waitTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self
                                                    selector:@selector(goToWellDone:) userInfo:nil repeats:NO];
    }
}

/*
 * Function is called when all the available tags are guessed right.
 * It will tell the app to go to a new viewController (which tells the player he/she did a good job!)
 */
-(void)goToWellDone:(id)sender
{
    
    UIViewController *wellDoneViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WellDone"];
    [self presentViewController:wellDoneViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
