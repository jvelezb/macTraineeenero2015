//
//  ViewController.h
//  UIKintDynamics
//
//  Created by Juan Velez Ballesteros on 28/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property CGPoint posicion;
@property(strong, nonatomic)UIView *cajaRoja;
@property (strong,nonatomic)UIView *cajaAzul;
@property (strong,nonatomic)UIDynamicAnimator *animator;
@property (strong, nonatomic) UIAttachmentBehavior *attachment;


@end

