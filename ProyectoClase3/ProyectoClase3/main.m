//
//  main.m
//  ProyectoClase3
//
//  Created by Juan Velez Ballesteros on 13/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *marcaCarros;
        NSString *nombre = [[NSString alloc]init];
        marcaCarros =[[NSArray alloc] initWithObjects:@"Nissan",@"VW",@"BMW", @"Toyoyta",@"Ford", nil];
        NSArray *refrescos =@[@"Coca cola",@"Sprite", @"Pepsi"];
        NSArray *arregloDeArreglos =@[@[@"1",@"2"],@[@"3",@"5"]];
        NSString *carro = [marcaCarros objectAtIndex:0];
        NSLog(@"el primer vehiculo es %@",carro);
        NSString *carro2 = marcaCarros[1];
        NSLog(@"El segundo vehiculo es %@",carro2);
        int  cuenta=[marcaCarros count];
        NSLog(@"la cuenta es  %U",cuenta);
        NSNumber *numero1 = [NSNumber numberWithInt:10];
        NSNumber *numero2= @512;
        NSNumber *numero3 =[NSNumber numberWithFloat:512.02f];
        NSNumber *numero =@'A';
        numero = @YES;
        
        NSDictionary *libros=[NSDictionary dictionaryWithObjectsAndKeys:numero1,@1,numero2,@2,numero3,@3, nil];
        
        NSLog(@"Libros %f",[libros[@3] floatValue]);
        NSMutableArray *nombrePersonas =[@[@"Toño",@"Juan",@"Carlos"] mutableCopy];
        [nombrePersonas addObject:@"Federico"];
        [nombrePersonas addObject:[NSNumber numberWithInt:12]];
        NSLog(@"El tamaño del arreglo es %d",[nombrePersonas count]);
        
        for (int i = 0; i<[nombrePersonas count];i++){
            NSLog(@"La posicion %d su valor es: %@",i,nombrePersonas[i]);
        }
        
        
        
        
        
      
    }
    return 0;
}
