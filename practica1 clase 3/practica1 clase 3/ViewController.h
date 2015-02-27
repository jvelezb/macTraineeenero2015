//
//  ViewController.h
//  practica1 clase 3
//
//  Created by Juan Velez Ballesteros on 20/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *etiqueta;
@property (strong, nonatomic) IBOutlet UITextField *entrada;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constraint1;

- (IBAction)boton:(id)sender;

@end

