//
//  StartTaggingViewController.h
//  Tag to Tap
//
//  Created by Tony Wael Abidi on 4/19/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaggedImage.h"
#import "StaticData.h"

@interface StartTaggingViewController : UIViewController{
    BOOL           keyboardVisible;
    CGPoint        offset;
    UIScrollView  *scrollview;
    CGPoint originalCenter;
}

@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *touchListener;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *resizeTouchListener;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImage *image;
@property TaggedImage *taggedImage;
@property StaticData *dataSource;
@property Tag *latestTag;

@property UIButton *shadowButton;

-(id)initWithTaggedImage:(TaggedImage *)theTaggedImage;

@end
