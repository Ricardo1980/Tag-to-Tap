//
//  ViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 3/8/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "ViewController.h"
#import "ParentViewController.h"
#import "StaticData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_creditsImage setAlpha:0.0];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)qmarkButtonPressed:(id)sender {
    if(_creditsImage.alpha == 0)
        [_creditsImage setAlpha:1.0];
    else if(_creditsImage.alpha == 1.0)
        [_creditsImage setAlpha:0.0];
}
@end
