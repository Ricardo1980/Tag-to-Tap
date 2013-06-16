//
//  chooseTaggedPicViewController.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi & Gert-jan Booij on 4/25/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "chooseTaggedPicViewController.h"
#import "EditPicViewController.h"
#import "TagGameViewController.h"
#import "GuessWhatViewController.h"

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

/*
 * When this viewController is the current one, the function below will be executed.
 * Here we initiate several things like showing the right tag-settings.
 */
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    numberOfUseableImages = 0;
    currentImageID = 0;
    
    _dataSource = [[StaticData alloc]init];
    _dataSource.guessWhatGameMode = NO;
    numberOfUseableImages = _dataSource.allTaggedImages.count;
    if(numberOfUseableImages != 0)
    {
        _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
        _imageViewForEditPic.image = _chosenTaggedImage.image;
        _imageViewForTagGame.image = _chosenTaggedImage.image;
        _imageViewForGuessWhat.image = _chosenTaggedImage.image;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 * When you switch to another viewController, this function will be called automatically.
 * Every link, or seque, has an identifier (name). You can check which seque will be executed and you can
 * change or initiate things before you go to the next viewController.
 */
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
    if ([segue.identifier isEqualToString:@"fromChosenToGuessWhat"]) {
        
        GuessWhatViewController *guessWhatViewController = [[GuessWhatViewController alloc] initWithTaggedImage:_chosenTaggedImage];
        guessWhatViewController = segue.destinationViewController;
        
        NSLog(@"taggedImageToSend.idNumber: %i",_chosenTaggedImage.idNumber);
        guessWhatViewController.taggedImage = _chosenTaggedImage;
    }
    
}

/*
 * Below you find next/previous functions for different versions of this viewContoller.
 * (When we made 1 function for all the version, it bugged sometimes)
 * In the Next-methode: the next TaggedImage in the static array (which contains all TaggedImages in the app) will be loaded.
 * In de Previous-methode: the previous TaggedImage in the static array (which contains all TaggedImages in the app) will be loaded.
 * The functions use the wrap-arround mathod, so if the last TaggedImage in the array is the current one, the NEXT will be first one in the array.
 */

- (IBAction)nextImageForEditPic:(id)sender {
    if(numberOfUseableImages > 0){
        if(currentImageID < (numberOfUseableImages-1))
        {
            currentImageID++;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForEditPic.image = _chosenTaggedImage.image;
            
        }
        else if(currentImageID >= (numberOfUseableImages-1)){
            currentImageID = 0;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForEditPic.image = _chosenTaggedImage.image;
        }
        NSLog(@"currentImageID: %i",currentImageID);
    }
}

- (IBAction)previousImageForEditPic:(id)sender {
    if(numberOfUseableImages > 0){
        if(currentImageID <= (numberOfUseableImages-1) && currentImageID > 0)
        {
            currentImageID--;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForEditPic.image = _chosenTaggedImage.image;
            
        }
        else if(currentImageID == 0){
            currentImageID = numberOfUseableImages-1;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForEditPic.image = _chosenTaggedImage.image;
        }
        NSLog(@"currentImageID: %i",currentImageID);
    }
}
- (IBAction)nextImageForTagGame:(id)sender {
    if(numberOfUseableImages > 0){
        if(currentImageID < (numberOfUseableImages-1))
        {
            currentImageID++;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForTagGame.image = _chosenTaggedImage.image;
            
        }
        else if(currentImageID >= (numberOfUseableImages-1)){
            currentImageID = 0;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForTagGame.image = _chosenTaggedImage.image;
        }
        NSLog(@"currentImageID: %i",currentImageID);
    }
}

- (IBAction)nextImageForGuessWhat:(id)sender {
    if(numberOfUseableImages > 0){
        if(currentImageID < (numberOfUseableImages-1))
        {
            currentImageID++;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForGuessWhat.image = _chosenTaggedImage.image;
            
        }
        else if(currentImageID >= (numberOfUseableImages-1)){
            currentImageID = 0;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForGuessWhat.image = _chosenTaggedImage.image;
        }
        NSLog(@"currentImageID: %i",currentImageID);
    }
}

- (IBAction)previousImageForTagGame:(id)sender {
    if(numberOfUseableImages > 0){
        if(currentImageID <= (numberOfUseableImages-1) && currentImageID > 0)
        {
            currentImageID--;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForTagGame.image = _chosenTaggedImage.image;
            
        }
        else if(currentImageID == 0){
            currentImageID = numberOfUseableImages-1;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForTagGame.image = _chosenTaggedImage.image;
        }
        NSLog(@"currentImageID: %i",currentImageID);
    }
}

- (IBAction)previousImageForGuessWhat:(id)sender {
    if(numberOfUseableImages > 0){
        if(currentImageID <= (numberOfUseableImages-1) && currentImageID > 0)
        {
            currentImageID--;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForGuessWhat.image = _chosenTaggedImage.image;
            
        }
        else if(currentImageID == 0){
            currentImageID = numberOfUseableImages-1;
            _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
            _imageViewForGuessWhat.image = _chosenTaggedImage.image;
        }
        NSLog(@"currentImageID: %i",currentImageID);
    }
}

/*
 * Deleten van een taggedImage uit de array met alle TaggedImages
 * Na het deleten wordt gekeken of er nog een TaggedImage voor of na deze in de array staat.
 * Zo ja dan wordt die geladen op het scherm.
 */

- (IBAction)deleteTaggedImage:(id)sender {
    if(numberOfUseableImages > 0){
        NSLog(@"available tagged Images BEFORE remove: %i",numberOfUseableImages);
        [_dataSource.allTaggedImages removeObjectAtIndex:currentImageID];
        numberOfUseableImages = _dataSource.allTaggedImages.count;
        NSLog(@"available tagged Images AFTER remove: %i",numberOfUseableImages);
        _dataSource.currentNumberOfTaggedImages -= 1;
        for (int i=0; i<numberOfUseableImages; i++) {
            TaggedImage *helper = [_dataSource.allTaggedImages objectAtIndex:i];
            helper.idNumber -= 1;
        }
        if(numberOfUseableImages > 0){
            if(currentImageID < (numberOfUseableImages-1))
            {
                currentImageID++;
                _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
                _imageViewForEditPic.image = _chosenTaggedImage.image;
                
            }
            else if(currentImageID >= (numberOfUseableImages-1)){
                currentImageID = 0;
                _chosenTaggedImage = [_dataSource.allTaggedImages objectAtIndex:currentImageID];
                _imageViewForEditPic.image = _chosenTaggedImage.image;
            }
            NSLog(@"currentImageID: %i",currentImageID);
        }
        else{
            _chosenTaggedImage = nil;
            _imageViewForEditPic.image = nil;
        }
        
    }
}
@end
