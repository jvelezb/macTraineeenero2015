//
//  ViewController.m
//  FileManager
//
//  Created by Juan Velez Ballesteros on 24/01/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFileManager *fileManager;
    NSString *nombreArchivo;
    NSString *directorio;
    NSArray *rutas;
    
    fileManager = [NSFileManager defaultManager];
    
    rutas =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"Tamaño del arreglo rutas %lui",rutas.count);
    NSLog(@"Array: %@",rutas);
    directorio =rutas[0];
    nombreArchivo = [directorio stringByAppendingPathComponent:@"archivo.txt"];
    NSLog(@"Nombre de archivo %@",nombreArchivo);
    
    if([fileManager fileExistsAtPath:nombreArchivo]){
        NSData *lecturaArchivo =[fileManager contentsAtPath:nombreArchivo];
        NSString *dataString = [[NSString alloc]initWithData:lecturaArchivo encoding:NSASCIIStringEncoding];
        _textBox.text = dataString;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)guardaBoton:(id)sender {
    NSFileManager *fileManager;
    NSData *data;
    NSString *archivo;
    NSString *directorio;
    NSArray *rutas;
    
    fileManager =[NSFileManager defaultManager];
    rutas =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"Tamaño del arreglo rutas %lui",rutas.count);
    NSLog(@"Array: %@",rutas);
    directorio =rutas[0];
    archivo= [directorio stringByAppendingPathComponent:@"archivo.txt"];
    NSLog(@"Nombre de archivo %@",archivo );
    data =[_textBox.text dataUsingEncoding:NSASCIIStringEncoding];
    [fileManager createFileAtPath:archivo contents:data attributes:nil];
    
    
    
    
    
    
    
}
@end
