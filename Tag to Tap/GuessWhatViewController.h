//
//  GuessWhatViewController.h
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 5/20/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaggedImage.h"
#import "StaticData.h"

@interface GuessWhatViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImage *image;
@property (strong, nonatomic) IBOutlet UILabel *TextToGuesslabel;
@property TaggedImage *taggedImage;
@property StaticData *dataSource;
@property NSMutableArray *availableTags;
@property NSTimer *updateTimer;
@property NSTimer *waitTimer;

-(id)initWithTaggedImage:(TaggedImage *)theTaggedImage;
-(void)getTextToGuess;

@end
