//
//  TakePicController.h
//  Tag to Tap
//
//  Created by Tony Wael Abidi on 4/3/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TakePicController : UIViewController <UIPopoverControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *cameraRollButton;
@property (strong, nonatomic) IBOutlet UIPopoverController *popOverController;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *cameraButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)cameraRoll:(id)sender;
- (IBAction)camera:(id)sender;

@end
