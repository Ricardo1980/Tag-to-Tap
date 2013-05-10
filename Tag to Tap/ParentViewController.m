//
//  ParentViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi on 4/3/13.
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
        //if statment is used to check if we are on a ipad(non retina) or an ipad retina 
    if ([[UIScreen mainScreen]respondsToSelector:@selector(scale)]&& [[UIScreen mainScreen]scale ]== 2.0) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default-Landscape~ipad.png"]];
    }else{
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default-Landscape@2x~ipad.png"]];
	}
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
@end
