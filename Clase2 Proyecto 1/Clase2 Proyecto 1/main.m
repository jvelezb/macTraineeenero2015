//
//  main.m
//  Clase2 Proyecto 1
//sdfjlsdlkfña cualquier cosa


//  Created by Juan Velez Ballesteros on 06/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mamifero.h"
#import "Animal.h"
#import "Pez.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"creando animales");
        Animal *animal1;
        Mamifero *mamifero1;
        animal1 =[Animal alloc];
        animal1 = [animal1 init];
        mamifero1 = [[Mamifero alloc]init];
        [animal1 setColor:@"Naranja" andNumerExtremidades:4 andTamano:@"Grande" gordito:122.3 ];
        int numeroExtra = [animal1 getExtremidades];
        NSLog(@"El numero de extremidades es: %i \n",numeroExtra);
        NSLog(@"Que empiece a reproducir: %@",[animal1 reproducir]);
        if([mamifero1 isKindOfClass:([Animal class]) ]){
            NSLog(@"Mamifero es una Animal");
            
        }else{
             NSLog(@"Mamifero no es una Animal");
        }
        [animal1 nazcoConPulmones];
        NSLog(@"tengo %i pulmones",animal1.tengoPulmones);
        
        

        NSLog(@"EL PESO DEL MAMIFERO %f",[mamifero1 getPeso] );
        
        
        Animal *animal2 =[[Mamifero alloc]init];
        animal2 = [[Pez alloc]init ];
         NSLog(@"alimentar %@",animal2.moverse);
       
        
        
        
        
        
        
        
        
        
    
    }
    return 0;
}



