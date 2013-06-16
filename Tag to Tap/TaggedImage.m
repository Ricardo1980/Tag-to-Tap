//
//  TaggedImage.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/17/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "TaggedImage.h"

@implementation TaggedImage
- (id)init
{
    self = [super init];
    if (self) {
        _tags = [[NSMutableArray alloc] init];
    }
    return self;
}

/*
 * Initialize function for a Tagged Image, where an IDnumber and Image is needed as parameter.
 */
-(void)createTaggedImage:(int)theIDNumber withImage:(UIImage *)image{
    _image = image;
    _idNumber = theIDNumber;
}

/*
 * Initialize function for a Tagged Image, where an IDnumber, Image and Tag is needed as parameter.
 */
-(void)createTaggedImage:(int)theIDNumber withImage:(UIImage *)image andTag:(Tag *)theTag{
    _idNumber = theIDNumber;
    _image = image;
    [_tags addObject:theTag];
    
}

/*
 * Method to add a tag to the tags array of this TaggedImage.
 */
-(void)addTagtoArray:(Tag *)theTag{
    [_tags addObject:theTag];
}

@end
