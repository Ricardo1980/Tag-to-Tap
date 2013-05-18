//
//  Tag.m
//  Tag to Tap
//
//  Created by Tony Wael Abidi on 4/17/13.
//  Copyright (c) 2013 Itopia. All rights reserved.
//

#import "Tag.h"
#import "TakePicController.h"
#import "EditPicViewController.h"
#import "StartTaggingViewController.h"
#import "StaticData.h"

int changeColor=0;

@implementation Tag
-(void)createTag:(UIViewController *)sender atLocation:(CGPoint)location{
    
    //Settings for the Button:
    _tagButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _tagButton.frame = CGRectMake((location.x - 75), (location.y - 50), 150, 100);
    [[_tagButton layer] setCornerRadius:5.0f];
    [[_tagButton layer] setBorderWidth:2.5f];
    [[_tagButton layer] setBorderColor:[UIColor colorWithRed:(250/255.f) green:(250/255.f) blue:(250/255.f) alpha:1.0].CGColor];
    [_tagButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //Settings for the label:
    _tagLabel = [[UITextField alloc] initWithFrame:CGRectMake((location.x - 100), (location.y+50), 200, 20)];
    [_tagLabel addTarget:self action:@selector(labelClicked:) forControlEvents:UIControlEventTouchDown];
    [_tagLabel becomeFirstResponder];
    [_tagLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:16]];
    [_tagLabel setText:@"Click here to change text"];
    [_tagLabel setTextAlignment:NSTextAlignmentCenter];
    [_tagLabel setBackgroundColor:[UIColor clearColor]];
    [_tagLabel setTextColor:[UIColor colorWithRed:(250/255.f) green:(250/255.f) blue:(250/255.f) alpha:1.0]];
    [sender.view addSubview:_tagLabel];
    
    
}

-(void)setText:(NSString *)theText{
    _tagLabel.text = theText;
}

-(void)setVoice:(id)sender{
    
}

-(void)buttonClicked:(id)sender{
    StaticData *_dataSource = [[StaticData alloc]init];
    _dataSource.selectedTag = self;
    
    if(changeColor == 0){
        [[_tagButton layer] setBorderColor:[UIColor colorWithRed:(1/255.f) green:(1/255.f) blue:(1/255.f) alpha:1.0].CGColor];
        [_tagLabel setTextColor:[UIColor colorWithRed:(1/255.f) green:(1/255.f) blue:(1/255.f) alpha:1.0]];
        changeColor++;
    }
    else if(changeColor == 1){
        [[_tagButton layer] setBorderColor:[UIColor colorWithRed:(250/255.f) green:(250/255.f) blue:(250/255.f) alpha:1.0].CGColor];
        [_tagLabel setTextColor:[UIColor colorWithRed:(250/255.f) green:(250/255.f) blue:(250/255.f) alpha:1.0]];
        changeColor--;
    }
}

-(void)labelClicked:(id)sender{
    StaticData *_dataSource = [[StaticData alloc]init];
    _dataSource.selectedTag = self;
}

-(void)showButtonAndText:(UIViewController *)sender{
    [sender.view addSubview:_tagButton];
    [sender.view addSubview:_tagLabel];
}

-(void)showButton:(UIViewController *)sender{
    [sender.view addSubview:_tagButton];
}

-(void)showText:(UIViewController *)sender{
    [sender.view addSubview:_tagLabel];
}

@end
