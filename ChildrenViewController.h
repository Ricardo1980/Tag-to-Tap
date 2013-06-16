//
//  ChildrenViewController.h
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/17/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticData.h"

@interface ChildrenViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *creditsImage;
@property StaticData *dataSource;
- (IBAction)qmarkButtonPressed:(id)sender;

@end
