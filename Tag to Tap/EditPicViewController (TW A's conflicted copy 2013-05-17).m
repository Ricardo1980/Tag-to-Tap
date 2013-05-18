//
//  EditPicViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi on 4/17/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "EditPicViewController.h"
#import "Tag.h"
#import "TaggedImage.h"

@interface EditPicViewController ()

@end

@implementation EditPicViewController

- (id)initWithTaggedImage:(TaggedImage *)theTaggedImage
{
    self = [super init];
    if (self) {
        _taggedImage = theTaggedImage;
    }
    return self;
}

- (void)viewDidLoad{

    [self.imageView setImage:_taggedImage.image];
    for(int i=0; i<_taggedImage.tags.count; i++){
        Tag *helpTag = [[Tag alloc]init];
        helpTag = [_taggedImage.tags objectAtIndex:i];
        [helpTag showButtonAndText:self];
    }
    _touchListener =[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressDetected:)];
    _touchListener.minimumPressDuration = 1;
    _touchListener.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:_touchListener];
    
    _dataSource = [[StaticData alloc]init];

    [super viewDidLoad];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)longPressDetected:(UIGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Long press Ended");
        Tag *newTag = [[Tag alloc]init];
        CGPoint location = [_touchListener locationInView:self.view];
        [newTag createTag:self atLocation:location];
        [self.view addSubview:newTag.tagButton];
        [_taggedImage addTagtoArray:newTag];
        [_dataSource addTaggedImageToArray:_taggedImage atIndex:[_dataSource getCurrentTaggedImageID]-2];
    }
}

-(void) keyboardDidShow: (NSNotification *)notif
{
    NSLog(@"tag y height: %f", _dataSource.selectedTag.tagLabel.center.y);
    
    if(_dataSource.selectedTag.tagLabel.center.y > self.view.frame.size.height/2.8){
        self.view.center = CGPointMake(150,self->originalCenter.y);
    }
}
-(void) keyboardDidHide: (NSNotification *)notif
{
    self.view.center = self->originalCenter;
}
@end
