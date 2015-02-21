//
//  ViewController.m
//  bases de datos
//
//  Created by Juan Velez Ballesteros on 14/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *docDir;
    NSArray *directorios;
    directorios = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docDir = directorios[0];
    _locacionDB = [[NSString alloc]initWithString:[docDir stringByAppendingPathComponent:@"agenda.db"]];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if([filemgr fileExistsAtPath:_locacionDB]==NO){
        NSLog(@"No existe el archivo");
        const char *dbpath =[_locacionDB UTF8String];
        if(sqlite3_open(dbpath, &_baseDeDatos)==SQLITE_OK){
            char *mensajeError;
            const char *sql_stmt= "CREATE TABLE IF NOT EXISTS CONTACTOS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NOMBRE TEXT, DIRECCION TEXT, TELEFONO TEXT)";
            if(sqlite3_exec(_baseDeDatos, sql_stmt, NULL, NULL, &mensajeError)!= SQLITE_OK){
                NSLog(@"Se esta creando la base de datos");
                UIAlertController *error =[UIAlertController alertControllerWithTitle:@"Error" message:@"Problema con la base de datos" preferredStyle:UIAlertControllerStyleAlert];
                [error addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    
                }]];
                 [self presentViewController:error animated:YES completion:nil];
                
                
            }
            sqlite3_close(_baseDeDatos);
            
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)guardar:(id)sender {
    NSLog(@"Guardar");
    NSLog ( _locacionDB);
    sqlite3_stmt    *statement;
    const char *dbpath = [_locacionDB UTF8String];
    if(sqlite3_open(dbpath, &_baseDeDatos)==SQLITE_OK){
        NSLog(@"Se abrio la base de datos");
        NSString *insertSQL =[NSString stringWithFormat:@"INSERT INTO CONTACTOS (nombre, direccion, telefono) VALUES (\'%@\','%@\','%@\')",_nombre.text,_direccion.text,_telefono.text];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_baseDeDatos,insert_stmt,-1,&statement,NULL);
        if(sqlite3_step(statement)==SQLITE_DONE){
            NSLog(@"Se ha insertado el registro");
            UIAlertController *error =[UIAlertController alertControllerWithTitle:@"Exito" message:@"se inserto sin problemas el registro" preferredStyle:UIAlertControllerStyleAlert];
            [error addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                _nombre.text = @"";
                _direccion.text = @"";
                _telefono.text = @"";
                
            }]];
            [self presentViewController:error animated:YES completion:nil];
          
        }else{
            UIAlertController *error =[UIAlertController alertControllerWithTitle:@"erro" message:@"NO se insertor el codigo" preferredStyle:UIAlertControllerStyleAlert];
            [error addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
            }]];
            [self presentViewController:error animated:YES completion:nil];

            
        }
        sqlite3_finalize(statement);
        sqlite3_close(_baseDeDatos);
                           
    }
    
}

- (IBAction)encontrar:(id)sender {
    NSLog (@"estamos en encontrar");
    const char *dbpath = [_locacionDB UTF8String];
    sqlite3_stmt *statement;
    if(sqlite3_open(dbpath,&_baseDeDatos)==SQLITE_OK)
    {
        NSString *querySQL =[NSString stringWithFormat:@"SELECT nombre,direccion,telefono from CONTACTOS where NOMBRE = \'%@\'",_nombre.text];
        const char *query_stmt =[querySQL UTF8String];
        if(sqlite3_prepare_v2(_baseDeDatos,query_stmt,-1,&statement,NULL)==SQLITE_OK)
        {
            if(sqlite3_step(statement)==SQLITE_ROW){
                NSString *direccionStr =[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                _direccion.text = direccionStr;
                NSString *telefonoStr =[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                _telefono.text = telefonoStr;
            }else{
                //no se encontro
            }
            sqlite3_finalize(statement);
            
        }
        sqlite3_close(_baseDeDatos);
    }
    
}
@end
