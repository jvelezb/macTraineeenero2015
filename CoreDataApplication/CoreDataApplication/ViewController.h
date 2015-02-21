//
//  ViewController.h
//  CoreDataApplication
//
//  Created by Juan Velez Ballesteros on 14/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nombre;
@property (strong, nonatomic) IBOutlet UITextField *direccion;
@property (strong, nonatomic) IBOutlet UITextField *telefono;
- (IBAction)guardar:(id)sender;
- (IBAction)buscar:(id)sender;

@end

