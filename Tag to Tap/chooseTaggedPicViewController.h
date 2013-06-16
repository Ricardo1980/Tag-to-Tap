//
//  chooseTaggedPicViewController.h
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/25/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticData.h"

@interface chooseTaggedPicViewController : UIViewController{
    
}

@property (strong, nonatomic) IBOutlet UIImageView *imageViewForEditPic;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewForTagGame;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewForGuessWhat;
@property NSArray *taggedImages;
@property StaticData *dataSource;
@property TaggedImage *chosenTaggedImage;


- (IBAction)nextImageForEditPic:(id)sender;
- (IBAction)nextImageForTagGame:(id)sender;
- (IBAction)nextImageForGuessWhat:(id)sender;
- (IBAction)previousImageForEditPic:(id)sender;
- (IBAction)previousImageForTagGame:(id)sender;
- (IBAction)previousImageForGuessWhat:(id)sender;
- (IBAction)deleteTaggedImage:(id)sender;

@end
