//
//  TaggedImage.h
//  Tag to Tap
//
//  Created by Student on 4/17/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tag.h"

@interface TaggedImage : NSObject

@property NSMutableArray *tags;
@property UIImage *image;
@property int idNumber;

-(void)createTaggedImage:(int)theIDNumber withImage:(UIImage *)image;
-(void)createTaggedImage:(int)theIDNumber withImage:(UIImage *)image andTag:(Tag *)theTag;
-(void)addTagtoArray:(Tag *)theTag;

@end
