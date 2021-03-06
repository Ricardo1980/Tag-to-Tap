//
//  TagGameViewController.h
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 5/26/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaggedImage.h"
#import "StaticData.h"


@interface TagGameViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImage *image;
@property TaggedImage *taggedImage;
@property StaticData *dataSource;
@property NSMutableArray *availableTags;

-(id)initWithTaggedImage:(TaggedImage *)theTaggedImage;

@end
