//
//  ViewController.m
//  UIKintDynamics
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
    CGRect frameRect = CGRectMake(10,20,80,80);
    _cajaAzul =[[UIView alloc]initWithFrame:frameRect];
    _cajaAzul.backgroundColor = [UIColor blueColor];
    
    frameRect = CGRectMake(150,20,60,60);
    _cajaRoja =[[UIView alloc]initWithFrame:frameRect];
    _cajaRoja.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_cajaRoja];
    [self.view addSubview:_cajaAzul];
    
    _animator =[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    UIGravityBehavior *gravedad =[[UIGravityBehavior alloc]initWithItems:@[_cajaAzul,_cajaRoja]];
    UICollisionBehavior *colision  =[[UICollisionBehavior alloc]initWithItems:@[_cajaRoja,_cajaAzul]];
    colision.translatesReferenceBoundsIntoBoundary =YES;
    UIDynamicItemBehavior *comportamiento =[[UIDynamicItemBehavior alloc]initWithItems:@[_cajaAzul]];
    comportamiento.elasticity = 0.5;
    UIAttachmentBehavior *pegado =[[UIAttachmentBehavior alloc]initWithItem:_cajaAzul attachedToItem:_cajaRoja ];
    [pegado setFrequency:4.0];
    [pegado setDamping:0.0];
    
    CGVector vector = CGVectorMake(0.0, 1.0);
    [gravedad setGravityDirection:vector];
    
    [_animator addBehavior:pegado];
    [_animator addBehavior:comportamiento];

    [_animator addBehavior:gravedad];
    [_animator addBehavior:colision];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch =[touches anyObject];
    _posicion =[touch locationInView:self.view];
    
    UIOffset offset = UIOffsetMake(20, 20);
    _attachment=[[UIAttachmentBehavior alloc]initWithItem:_cajaAzul offsetFromCenter:offset attachedToAnchor:_posicion];
    [_animator addBehavior:_attachment];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch =[touches anyObject];
    _posicion =[touch locationInView:self.view];
    _attachment.anchorPoint =_posicion;
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [_animator removeBehavior:_attachment];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
