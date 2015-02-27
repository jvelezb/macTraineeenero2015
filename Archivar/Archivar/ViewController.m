//
//  ViewController.m
//  Archivar
//
//  Created by Juan Velez Ballesteros on 24/01/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "ViewController.h"
#import "Contacto.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    //comentarios

    [super viewDidLoad];
    _contactoArray =[[NSMutableArray alloc]init];
    _paises =@[@"Mexico",@"Argentina",@"Rusia",@"Chile",@"España",@"Japon",@"Australia"];
    NSFileManager *fileManager;
    NSString *directorio;
    NSArray *rutas;
    _cuenta =0;
    fileManager = [NSFileManager defaultManager];
    rutas =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    directorio =rutas[0];
    _rutaArchivo = [[NSString alloc]initWithString:[directorio stringByAppendingPathComponent:@"datos3.archivo"]];
    NSLog(@"la ruta es: %@",_rutaArchivo);
    if([fileManager fileExistsAtPath:_rutaArchivo])
    {
        
        NSLog (@"leyendo");
       
        _contactoArray = [NSKeyedUnarchiver unarchiveObjectWithFile:_rutaArchivo];
        if(_contactoArray!=nil){
            _nombre.text = _contactoArray[0];
            _direccion.text =_contactoArray[1];
            _telefono.text =_contactoArray[2];
        
            NSDateFormatter *formatoFecha =[[NSDateFormatter alloc]init];
            [formatoFecha setDateFormat:@"dd-MM-yyyy"];
            NSDate *fechaDeString = [[NSDate alloc]init];
            fechaDeString=[formatoFecha dateFromString:_contactoArray[3] ];
            [_fechaNac setDate:fechaDeString];
            
            NSInteger paisIntGuardado =[_contactoArray[4] integerValue];
            [_lugarNac selectRow:paisIntGuardado inComponent:0 animated:YES];
            
            
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)guardar:(id)sender {
      NSLog(@"la ruta es %@",_rutaArchivo);
   
    NSDate *fechaDeNacimiento = [_fechaNac date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *selectionString = [dateFormatter stringFromDate:fechaDeNacimiento];
        NSLog(@"La fecha de nacimiento es %@",selectionString);
    if(_contactoArray == nil){
        _contactoArray =[[NSMutableArray alloc]init];

    }
    [_contactoArray addObject:_nombre.text];
    
     [_contactoArray addObject:_direccion.text];
    [_contactoArray addObject:_telefono.text];
    [_contactoArray addObject:selectionString];
    NSString *paisSeleccionado = [NSString stringWithFormat:@"%ld",(long)[_lugarNac selectedRowInComponent:0]];
    [_contactoArray addObject:paisSeleccionado];
    
    
    
    [NSKeyedArchiver archiveRootObject:_contactoArray toFile:_rutaArchivo ];
   
}

- (IBAction)avanza:(id)sender {
    _cuenta++;
    if(_contactoArray.count>_cuenta*campos+(campos-1)){
      
        _nombre.text =_contactoArray[_cuenta*campos
];
        _direccion.text =_contactoArray[_cuenta*campos+1];
        _telefono.text =_contactoArray[_cuenta*campos+2];///
                NSDateFormatter *formatoFecha =[[NSDateFormatter alloc]init];
        [formatoFecha setDateFormat:@"dd-MM-yyyy"];
        NSDate *fechaDeString = [[NSDate alloc]init];
        fechaDeString=[formatoFecha dateFromString:_contactoArray[_cuenta*campos+3] ];
        [_fechaNac setDate:fechaDeString];
        
        NSInteger paisIntGuardado =[_contactoArray[_cuenta*campos+4] integerValue];
        [_lugarNac selectRow:paisIntGuardado inComponent:0 animated:YES];

    }else{
        UIAlertController *alerta =[UIAlertController alertControllerWithTitle:@"No hay mas registros" message:@"Llegaste al final" preferredStyle:UIAlertControllerStyleAlert];
        [alerta addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            _nombre.text = @"";
            _direccion.text =@"";
            _telefono.text =@"";
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }]];
        [alerta addAction:[UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            _nombre.text = @"xxxx";
            _direccion.text =@"xxxx";
            _telefono.text =@"xxxx";
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }]];
        [alerta addAction:[UIAlertAction actionWithTitle:@"Quizas.." style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            _nombre.text = @"rrr";
            _direccion.text =@"rrr";
            _telefono.text =@"rrrr";
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }]];
        [self presentViewController:alerta animated:YES completion:nil];
        
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _paises.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *mensaje = [@"nacionalidad: " stringByAppendingString:_paises[row] ];
    UIAlertController *alerta =[UIAlertController alertControllerWithTitle:@"Nacionalidad" message: mensaje preferredStyle:UIAlertControllerStyleAlert];
    [alerta addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
               [self dismissViewControllerAnimated:YES completion:nil];
        
    }]];
    [self presentViewController:alerta animated:YES completion:nil];
    

    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _paises[row];
    
}
@end
