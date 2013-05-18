//
//  chooseTaggedPicViewController.m
//  Tag to Tap
//
//  Created by Student on 4/25/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "chooseTaggedPicViewController.h"
#import "EditPicViewController.h"
#import "TagGameViewController.h"

@interface chooseTaggedPicViewController ()

@end

int numberOfUseableImages = 0;
int currentImageID = 0;

@implementation chooseTaggedPicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
//    if ([[UIScreen mainScreen]respondsToSelector:@selector(scale)]&& [[UIScreen mainScreen]scale ]== 2.0) {
//        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default-Landscape~ipad.png"]];
//    }else{
//        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Default-Landscape@2x~ipad.png"]];
//	}
    
	// Do any additional setup after loading the view.
    numberOfUseableImages = 0;
    currentImageID = 0;
    
    _dataSource = [[StaticData alloc]init];
    numberOfUseableImages = _dataSource.allTaggedImages.count;
    if(numberOfUseableImages != 0)
    {
        _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
        _imageViewForEditPic.image = _chosenTaggedImage.image;
        _imageViewForTagGame.image = _chosenTaggedImage.image;
        currentImageID++;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"fromChosenToEditTaggedImage"]) {
        
        EditPicViewController *editTaggedPictureViewController = [[EditPicViewController alloc] initWithTaggedImage:_chosenTaggedImage];
        editTaggedPictureViewController = segue.destinationViewController;
        
        NSLog(@"taggedImageToSend.idNumber: %i",_chosenTaggedImage.idNumber);
        editTaggedPictureViewController.taggedImage = _chosenTaggedImage;
    }
    if ([segue.identifier isEqualToString:@"fromChosenToTagGame"]) {
        
        TagGameViewController *tagGameViewController = [[TagGameViewController alloc] initWithTaggedImage:_chosenTaggedImage];
        tagGameViewController = segue.destinationViewController;
        
        NSLog(@"taggedImageToSend.idNumber: %i",_chosenTaggedImage.idNumber);
        tagGameViewController.taggedImage = _chosenTaggedImage;
    }

}

- (IBAction)nextImageForEditPic:(id)sender {
    if(currentImageID <= (numberOfUseableImages-1))
    {
        _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
        _imageViewForEditPic.image = _chosenTaggedImage.image;
        currentImageID++;
    }
    NSLog(@"currentImageID: %i",currentImageID);
}

- (IBAction)previousImageForEditPic:(id)sender {
    if((currentImageID <= numberOfUseableImages)&& currentImageID > 0)
    {
        currentImageID--;
        _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
        _imageViewForEditPic.image = _chosenTaggedImage.image;
        
    }
    NSLog(@"currentImageID: %i",currentImageID);
}
- (IBAction)nextImageForTagGame:(id)sender {
    if(currentImageID <= (numberOfUseableImages-1))
    {
        _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
        _imageViewForTagGame.image = _chosenTaggedImage.image;
        currentImageID++;
    }
    NSLog(@"currentImageID: %i",currentImageID);
}

- (IBAction)previousImageForTagGame:(id)sender {
    if((currentImageID <= numberOfUseableImages)&& currentImageID > 0)
    {
        currentImageID--;
        _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
        _imageViewForTagGame.image = _chosenTaggedImage.image;
        
    }
    NSLog(@"currentImageID: %i",currentImageID);
}

- (IBAction)deleteTaggesImage:(id)sender {
    if(numberOfUseableImages > 0){
        
        _chosenTaggedImage = nil;
        NSLog(@"available tagged Images BEFORE remove: %i",numberOfUseableImages);
        [_dataSource.allTaggedImages removeObjectAtIndex:currentImageID];
        _dataSource.currentTaggedImageID -= 1;
        numberOfUseableImages = _dataSource.allTaggedImages.count;
        NSLog(@"available tagged Images AFTER remove: %i",numberOfUseableImages);
//        if(currentImageID < numberOfUseableImages){
//            int test = currentImageID;
//            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:test];
//            _imageViewForTagGame.image = _chosenTaggedImage.image;
//        }else{
//            _imageViewForEditPic.image = nil;
//        }
//        if(currentImageID < numberOfUseableImages){
//            for (int i = currentImageID; i<numberOfUseableImages; i++) {
//                int helperIndex = i+1;
//                TaggedImage *helper = [_dataSource.allTaggedImages objectAtIndex:helperIndex];
//                [_dataSource addTaggedImageToArray:helper atIndex:i];
//                [_dataSource.allTaggedImages removeObjectAtIndex:helperIndex];
//            }
//        }
        
    }
}
@end
