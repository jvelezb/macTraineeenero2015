//
//  ViewController.m
//  prueba
//
//  Created by Juan Velez Ballesteros on 20/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botonAction:(id)sender {
     UIImage *logos = [UIImage imageNamed:@"Logo.jpg"];
    [logos imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    _imagenViews.image = logos ;
    [_imagenViews setTintColor:[UIColor blueColor]];
}
@end
