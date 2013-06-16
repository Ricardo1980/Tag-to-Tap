//
//  ParentViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/3/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "ParentViewController.h"
#import "TakePicController.h"
@interface ParentViewController ()

@end

@implementation ParentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_creditsImage setAlpha:0.0];
	// Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToTakePicController:(id)sender {
}
- (IBAction)qmarkButtonPressed:(id)sender {
    
    if(_creditsImage.alpha == 0)
        [_creditsImage setAlpha:1.0];
    else if(_creditsImage.alpha == 1.0)
        [_creditsImage setAlpha:0.0];
}
@end
