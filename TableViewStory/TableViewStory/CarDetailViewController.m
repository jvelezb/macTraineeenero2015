//
//  CarDetailViewController.m
//  TableViewStory
//
//  Created by Neil Smyth on 9/17/13.
//  Copyright (c) 2013 Neil Smyth. All rights reserved.
//

#import "CarDetailViewController.h"

@interface CarDetailViewController ()

@end

@implementation CarDetailViewController

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
    _makeLabel.text = _carDetailModel[0];
    _modelLabel.text = _carDetailModel[1];
    _imageView.image = [UIImage imageNamed:_carDetailModel[2]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
