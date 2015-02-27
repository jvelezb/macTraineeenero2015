//
//  ViewController.h
//  Archivar
//
//  Created by Juan Velez Ballesteros on 24/01/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

const int campos =5;
@interface ViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>
@property (assign) int cuenta;
@property (strong, nonatomic) IBOutlet UITextField *nombre;
@property (strong, nonatomic) IBOutlet UITextField *direccion;
@property (strong, nonatomic) IBOutlet UITextField *telefono;
@property (strong, nonatomic) NSString *rutaArchivo;
@property (strong,nonatomic) NSMutableArray *contactoArray;
@property (strong, nonatomic) IBOutlet UIDatePicker *fechaNac;
@property (strong, nonatomic) NSArray *paises;
@property (strong, nonatomic) IBOutlet UIPickerView *lugarNac;


- (IBAction)guardar:(id)sender;
- (IBAction)avanza:(id)sender;

@end

