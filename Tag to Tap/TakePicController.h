//
//  TakePicController.h
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/3/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticData.h"

@interface TakePicController : UIViewController <UIPopoverControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIPopoverController *popOverController;


@property StaticData *dataSource;
@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)camera:(id)sender;
- (IBAction)choosePicButton:(id)sender;
@end
