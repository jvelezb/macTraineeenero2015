//
//  ViewController.h
//  Clase2Proyecto2
//
//  Created by Juan Velez Ballesteros on 06/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *etiqueta;
@property (strong, nonatomic) IBOutlet UITextField *textoEntrada;
- (IBAction)botonAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *boton;

@end

