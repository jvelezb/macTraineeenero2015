//
//  ViewController.m
//  Recognizer
//
//  Created by Juan Velez Ballesteros on 14/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)rotate:(id)sender {
        _etiqueta.text = @"Long Press";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)longPressAction:(id)sender {
    _etiqueta.text = @"Long Press";
}

- (IBAction)edgeAction:(id)sender {
        _etiqueta.text = @"edge Press";
}

- (IBAction)pacAction:(id)sender {
        _etiqueta.text = @"pan Press";
}

- (IBAction)swipe:(id)sender {
        _etiqueta.text = @"Swipe Press";
}
- (IBAction)pinchAction:(id)sender {
        _etiqueta.text = @"pinch Press";
}

- (IBAction)tapAction:(id)sender {
        _etiqueta.text = @"tap Press";
}
@end
