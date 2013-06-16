//
//  TakePicController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/3/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "TakePicController.h"
#import "Tag.h"
#import "TaggedImage.h"
#import "StartTaggingViewController.h"
#import "StaticData.h"

@interface TakePicController ()

@end

@implementation TakePicController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataSource = [[StaticData alloc]init];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * When you switch to another viewController, this function will be called automatically.
 * Every link, or seque, has an identifier (name). You can check which seque will be executed and you can
 * change or initiate things before you go to the next viewController. 
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"fromTakePicToStartTagging"]) {
        TaggedImage *taggedImageToSend = [[TaggedImage alloc]init];
        int imageID = [_dataSource getCurrentNumberOfTaggedImages];
        
        [taggedImageToSend createTaggedImage:imageID withImage:self.imageView.image];
        [_dataSource setCurrentNumberOfTaggedImages:imageID+1];
        
        
        StartTaggingViewController *startTaggingViewController = [[StartTaggingViewController alloc] initWithTaggedImage:taggedImageToSend];
        startTaggingViewController = segue.destinationViewController;
        
        if(taggedImageToSend.image != nil){
            [_dataSource addTaggedImageToArray:taggedImageToSend];
            NSLog(@"taggedImageToSend.idNumber: %i",taggedImageToSend.idNumber);
            startTaggingViewController.taggedImage = taggedImageToSend;
        }
    }
}

/*
 * Whenever a picture is made or chosesn, the imageView of this controller will be set with it.
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    self.imageView.image = image;
    [picker dismissModalViewControllerAnimated:YES];
}

/*
 * Function for camera-handling
 * Uses the build-in functions to show the camera in a popovercontroller.
 * You can make a picture with your camera and decide to use it or retake one.
 */
- (IBAction)camera:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker=[[UIImagePickerController alloc] init];
        picker.delegate=self;
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing=NO;
        self.popOverController = [[UIPopoverController alloc]
                                  initWithContentViewController:picker];
        [self.popOverController presentPopoverFromRect:CGRectMake(0.0, 0.0, 10.0,0.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];

    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error accerssing Camera" message:@"Device does not support a Camera" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
}

/*
 * Function to choose a picture from the 'camera roll' on the iPad.
 * Just like the camera-handling this function uses build-in functions for a popovercontroller.
 * You can look through all the pictures on your iPad and choose one for this app.
 */
- (IBAction)choosePicButton:(id)sender{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker=[[UIImagePickerController alloc] init];
        picker.delegate=self;
        picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing=NO;
        self.popOverController = [[UIPopoverController alloc]
                                  initWithContentViewController:picker];
        [self.popOverController presentPopoverFromRect:CGRectMake(0.0, 0.0, 10.0,10.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error accerssing photo library" message:@"Device does not support a photo library" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
