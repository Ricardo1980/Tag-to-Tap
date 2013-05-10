//
//  TaggedImage.m
//  Tag to Tap
//
//  Created by Student on 4/17/13.
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
-(void)createTaggedImage:(int)theIDNumber withImage:(UIImage *)image{
    _image = image;
    _idNumber = theIDNumber;
}
-(void)createTaggedImage:(int)theIDNumber withImage:(UIImage *)image andTag:(Tag *)theTag{
    _idNumber = theIDNumber;
    _image = image;
    [_tags addObject:theTag];
    
}
-(void)addTagtoArray:(Tag *)theTag{
    [_tags addObject:theTag];
}

@end
