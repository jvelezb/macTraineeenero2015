//
//  ViewController.h
//  bases de datos
//
//  Created by Juan Velez Ballesteros on 14/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nombre;
@property (strong, nonatomic) IBOutlet UITextField *direccion;
@property (strong, nonatomic) IBOutlet UITextField *telefono;
@property (strong, nonatomic) NSString *locacionDB;
@property (nonatomic)sqlite3 *baseDeDatos;

- (IBAction)guardar:(id)sender;
- (IBAction)encontrar:(id)sender;


@end

