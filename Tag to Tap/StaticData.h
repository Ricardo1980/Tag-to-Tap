//
//  StaticData.h
//  Tag to Tap
//
//  Created by Student on 4/18/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaggedImage.h"
#import "Tag.h" 

@interface StaticData : NSObject{
    
    //@public
    //NSMutableArray *allTaggedImages;
}

@property int currentTaggedImageID;
@property (strong, nonatomic) NSMutableArray *allTaggedImages;
@property Tag *selectedTag;
@property BOOL inEditMode;

-(int)getCurrentTaggedImageID;
-(void)setCurrentTaggedImageID:(int)theCurrentTaggedImageID;

-(NSString *)getFilePath;
-(void)saveData;
-(void)loadData;
-(void)addTaggedImageToArray:(TaggedImage *)theTaggedImage;
-(void)addTaggedImageToArray:(TaggedImage *)theTaggedImage atIndex:(int)theIndex;


@end
