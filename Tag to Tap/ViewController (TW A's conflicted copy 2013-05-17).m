//
//  ViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi on 3/8/13.
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
        //if statment is used to check we are on a ipad or an ipad retina 
    if ([[UIScreen mainScreen]respondsToSelector:@selector(scale)]&& [[UIScreen mainScreen]scale ]== 2.0) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default-Landscape~ipad.png"]];
    }else{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default-Landscape@2x~ipad.png"]];
	}
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)Button:(id)sender {
}
@end
