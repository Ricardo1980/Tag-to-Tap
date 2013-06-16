//
//  StartTaggingViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/19/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "StartTaggingViewController.h"
#import "TaggedImage.h"
#import "Tag.h"
#import "StaticData.h"

@interface StartTaggingViewController ()

@end

@implementation StartTaggingViewController

- (id)initWithTaggedImage:(TaggedImage *)theTaggedImage
{
    self = [super init];
    if (self) {
        _taggedImage = theTaggedImage;
    }
    return self;
}

/*
 * When this viewController is the current one, the function below will be executed.
 * Here we initiate several things like StaticData, Long-Gesture and keyboard handling.
 */
- (void)viewDidLoad
{
    _dataSource = [[StaticData alloc]init];
    _dataSource.inEditMode = YES;
    
    [self.imageView setImage:_taggedImage.image];
    _touchListener =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressDetected:)];
    _touchListener.minimumPressDuration = 0.2;
    _touchListener.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:_touchListener];
    
    
    NSLog(@"Datasource - current Tagged Image ID: %i",_dataSource.getCurrentNumberOfTaggedImages);
    NSLog(@"currentTaggedImage - Image ID: %i",_taggedImage.idNumber);
    //[_dataSource saveData];
    //[_dataSource loadData];
    
    self->originalCenter = self.view.center;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyboardDidShow:)
                                                 name: UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyboardDidHide:)
                                                 name: UIKeyboardDidHideNotification object:nil];
    
    _shadowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _shadowButton.hidden = YES;
    [[_shadowButton layer] setCornerRadius:5.0f];
    [[_shadowButton layer] setBorderWidth:2.5f];
    [[_shadowButton layer] setBorderColor:[UIColor colorWithRed:(180/255.f) green:(180/255.f) blue:(180/255.f) alpha:0.8].CGColor];
    [self.view addSubview:_shadowButton];
    
    [super viewDidLoad];
	
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * When a long-gesture is recognized by the iOS device, this function will be executed.
 * First there is a check if the position of the gesture is within specific boundaries.
 * Next, as long as there is a gesture the position of the shadow-button will be updated. 
 * At last when the the gesture has ended (within boundaries) the actual Tag will be placed on screen. 
 */
- (IBAction)longPressDetected:(UIGestureRecognizer *)sender {
    CGPoint location = [_touchListener locationInView:self.view];
    if(location.y >= 140 && location.y <= 688){
        if (sender.state == UIGestureRecognizerStateEnded) {
            _shadowButton.hidden = YES;
            
            NSLog(@"Long press Ended");
            Tag *newTag = [[Tag alloc]init];
            CGPoint location = [_touchListener locationInView:self.view];
            int tagID = [_taggedImage.tags count];
            [newTag createTag:self atLocation:location withIDNumber:tagID];
            [self.view addSubview:newTag.tagButton];
            [self.view addSubview:newTag.recordButton];
            [self.view addSubview:newTag.playButton];
            [self.view addSubview:newTag.stopButton];
            [self.view addSubview:newTag.deleteButton];
            [_taggedImage addTagtoArray:newTag];
            [_dataSource addTaggedImageToArray:_taggedImage atIndex:[_dataSource getCurrentNumberOfTaggedImages]-1];
            
        }
        else {
            
            CGPoint location = [_touchListener locationInView:self.view];
            _shadowButton.frame = CGRectMake((location.x - 75), (location.y - 50), 150, 100);
            _shadowButton.hidden = NO;
        }
    }
    else{
        
    }
    
}

/*
 * Below here are keyboard-handling functions
 */
-(void) keyboardDidShow: (NSNotification *)notif
{
    //NSDictionary* info = [notif userInfo];
    //NSValue* aValue = [info objectForKey:UIKeyboardBoundsUserInfoKey];
    //CGSize keyboardSize = [aValue CGRectValue].size;
    NSLog(@"tag y height: %f", _dataSource.selectedTag.tagLabel.center.y);
    
    if(_dataSource.selectedTag.tagLabel.center.y > self.view.frame.size.height/2.8){
        self.view.center = CGPointMake(50,self->originalCenter.y);
    }
}

-(void) keyboardDidHide: (NSNotification *)notif
{
    self.view.center = self->originalCenter;
}

-(void) hideKeyboard:(id)sender
{
    self.view.center = self->originalCenter;
    [self.view endEditing:YES];
}

@end
