//
//  ViewController.h
//  Poryecto
//
//  Created by Juan Velez Ballesteros on 17/01/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *detalleMarca;
@property (strong, nonatomic) IBOutlet UILabel *detalleModelo;
@property (strong, nonatomic) IBOutlet UIImageView *imagenDetalle;
@property(strong, nonatomic) NSArray *detalleAuto;
@end
