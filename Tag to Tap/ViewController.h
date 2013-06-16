//
//  ViewController.h
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 3/8/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UIPopoverControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *creditsImage;

- (IBAction)qmarkButtonPressed:(id)sender;

@end
