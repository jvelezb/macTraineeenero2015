//
//  ViewController.m
//  Animacion
//
//  Created by Juan Velez Ballesteros on 28/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _escala = 2;
    _angulo = 180;
    CGRect rectangulo = CGRectMake(10, 10, 45, 45);
    _caja = [[UIView alloc]initWithFrame:rectangulo];
    _caja.backgroundColor=  [UIColor redColor];
    [self.view addSubview:_caja];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch =[touches anyObject];
    CGPoint punto =[touch locationInView:self.view];
    [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationCurveEaseIn animations:^{
        CGAffineTransform escalaTransform = CGAffineTransformMakeScale(_escala, _escala);
        CGAffineTransform rotacionTransform = CGAffineTransformMakeRotation(_angulo*M_PI/180);
        _caja.transform = CGAffineTransformConcat(escalaTransform, rotacionTransform);
        
        _angulo = (_angulo == 180? 360:180);
        _escala =(_escala==2 ?1:2);
        _caja.center = punto;

    } completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
