//
//  StaticData.m
//  Tag to Tap
//
//  Created by Student on 4/18/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "StaticData.h"

@implementation StaticData

static StaticData *singleTon;

- (id)init
{
    if(singleTon == nil) {
        singleTon = [super init];
        _currentTaggedImageID = 1;
        _allTaggedImages = [[NSMutableArray alloc] init];
        if (self) {
            // double check
        }
    }
    return singleTon;
}

-(NSString *)getFilePath{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[pathArray objectAtIndex:0] stringByAppendingPathComponent:@"dataFile"];
}

-(int)getCurrentTaggedImageID{
    return _currentTaggedImageID;
}

-(void)setCurrentTaggedId:(int)theCurrentTaggedImageID{
    _currentTaggedImageID = theCurrentTaggedImageID;
}

-(void)saveData{
    
    //NSArray *saveArray = [[NSArray alloc] initWithObjects:_allTaggedImages, nil];
    [_allTaggedImages writeToFile:[self getFilePath] atomically:YES];
    
}

-(void)loadData{
    
    NSString *filePath = [self getFilePath];
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    NSLog(@"fileExists?: %i",fileExists);
    if(fileExists){
        //NSArray *loadArray = [[NSArray alloc] initWithContentsOfFile:filePath];
        [_allTaggedImages removeAllObjects];
        _allTaggedImages = [_allTaggedImages initWithContentsOfFile:filePath];
        
    }else{
        //_allTaggedImages = [[NSMutableArray alloc] init];
        NSLog(@"Save file does not exists");
    }
    
}

-(void)addTaggedImageToArray:(TaggedImage *)theTaggedImage{
    [_allTaggedImages addObject:theTaggedImage];
}

-(void)addTaggedImageToArray:(TaggedImage *)theTaggedImage atIndex:(int)theIndex{
    NSLog(@"Number of images in Array: %i", [_allTaggedImages count]);
    [_allTaggedImages replaceObjectAtIndex:theIndex withObject:theTaggedImage];
}

@end
