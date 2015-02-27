//
//  ViewController.h
//  Proyecto2Clase3
//
//  Created by Juan Velez Ballesteros on 13/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *etiqueta;
@property (strong, nonatomic) IBOutlet UITextField *campoEntrada;
- (IBAction)botonAction:(id)sender;
-(IBAction)textFieldReturn:(id)sender;


@end

