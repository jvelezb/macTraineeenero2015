//
//  Animal.m
//  Clase2 Proyecto 1
//
//  Created by Juan Velez Ballesteros on 06/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import "Animal.h"

@implementation Animal{
    int pulmones;
}



-(void) setColor:(NSString *)nombreColor andNumerExtremidades:(int) numero andTamano: (NSString *)tam gordito: (double) kg{
    color = nombreColor;
    numeroExtremidades = numero;
    tamano = tam;
    peso = kg;
}

-(void) setColor:(NSString * )nombreColor{
    color = nombreColor;
}
-(NSString *) getColor{
    return color;
}
-(int)getExtremidades{
    return numeroExtremidades;
    
}
-(double)getPeso{
    return peso;
}

-(NSString *)getTamano{
    return tamano;
    
}
-(NSString *) reproducir{
    return @"Me estoy reproduciendo";
    
}

-(NSString *) alimentar{
    return @"Me estoy alimentando";
    
}
-(NSString *)respirar{
    return @"Estoy respirándo";
    
}
-(int)getPulmones{
    return pulmones;
    
}
-(void) setPulmones:(int)numero{
    pulmones = numero;
}
-(void)nazcoConPulmones{
    pulmones = 2;
}
-(int) tengoPulmones{
    return pulmones;
}


@end
