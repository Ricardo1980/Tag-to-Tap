//
//  TagGameViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 5/26/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "TagGameViewController.h"

@interface TagGameViewController ()

@end

@implementation TagGameViewController

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
 * Here we initiate several things like showing the right tag-settings.
 */
- (void)viewDidLoad
{
    _dataSource = [[StaticData alloc]init];
    _dataSource.inEditMode = NO;
    _availableTags = [[NSMutableArray alloc]init];
    
    [self.imageView setImage:_taggedImage.image];
    for(int i=0; i<_taggedImage.tags.count; i++){
        Tag *helpTag = [[Tag alloc]init];
        helpTag = [_taggedImage.tags objectAtIndex:i];
        [helpTag showButtonAndText:self];
        [_availableTags addObject:helpTag];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
