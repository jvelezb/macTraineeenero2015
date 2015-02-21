//
//  ViewController.m
//  Touch
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSUInteger touchCount =[touches count];
    NSUInteger tapCount =[[touches anyObject] tapCount];
    _metodo.text =@"touchesBegan";
    _estatus.text = [NSString stringWithFormat:@"%d touches",touchCount];
    _tapStatus.text =[NSString stringWithFormat:@"%d taps", tapCount];
    
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSUInteger touchCount =[touches count];
    NSUInteger tapCount = [[touches anyObject]tapCount];
    _metodo.text = @"touchesMoved";
    _estatus.text = [NSString stringWithFormat:@"%d touches", touchCount];
    _tapStatus.text =[NSString stringWithFormat:@"%d taps",tapCount];
    
}
- (void) touchesEnded:(NSSet *)touches
            withEvent:(UIEvent *)event {
    NSUInteger touchCount =[touches count];
    NSUInteger tapCount = [[touches anyObject]tapCount];
    _metodo.text = @"touchesEnded";
    _estatus.text = [NSString stringWithFormat:@"%d touches", touchCount];
    _tapStatus.text =[NSString stringWithFormat:@"%d taps",tapCount];}


@end
