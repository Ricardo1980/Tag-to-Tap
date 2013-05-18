//
//  TakePicController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi on 4/3/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "TakePicController.h"
@interface TakePicController ()

@end

@implementation TakePicController


- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - code

- (IBAction)cameraRoll:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker=[[UIImagePickerController alloc] init];
        picker.delegate=self;
        picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing=NO;
        self.popOverController = [[UIPopoverController alloc]
                                  initWithContentViewController:picker];
        [self.popOverController presentPopoverFromRect:CGRectMake(0.0, 0.0, 10.0,0.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error accerssing photo library" message:@"Device does not support a photo library" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        
    }

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    self.imageView.image = image;
    [picker dismissModalViewControllerAnimated:YES];
}

- (IBAction)camera:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker=[[UIImagePickerController alloc] init];
        picker.delegate=self;
        picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing=NO;
        self.popOverController = [[UIPopoverController alloc]
                                  initWithContentViewController:picker];
        [self.popOverController presentPopoverFromRect:CGRectMake(0.0, 0.0, 10.0,0.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error accerssing Camera" message:@"Device does not support a Camera" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
        
    }

}



@end
