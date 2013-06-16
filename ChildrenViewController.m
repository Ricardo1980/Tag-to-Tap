//
//  ChildrenViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/17/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "ChildrenViewController.h"

@interface ChildrenViewController ()

@end

@implementation ChildrenViewController

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
    _dataSource = [[StaticData alloc]init];
    _dataSource.guessWhatGameMode = NO;
    _dataSource.inEditMode = NO;
    [super viewDidLoad];
    [_creditsImage setAlpha:0.0];

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
