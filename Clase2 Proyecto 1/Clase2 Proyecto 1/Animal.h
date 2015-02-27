//
//  Animal.h
//  Clase2 Proyecto 1
//
//  Created by Juan Velez Ballesteros on 06/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject{
    NSString *color;
    int numeroExtremidades;
    NSString *tamano;
    double peso;
}
-(void) setColor:(NSString *)nombreColor andNumerExtremidades:(int) numero andTamano: (NSString *)tam gordito: (double) kg;
-(void) setColor:(NSString * )nombreColor;
-(NSString *) getColor;
-(int)getExtremidades;
-(double)getPeso;
-(NSString *)getTamano;
-(NSString *) reproducir;
-(NSString *) alimentar;
-(NSString *)respirar;
-(void)nazcoConPulmones;
-(int)tengoPulmones;
-(NSString*)moverse;




@end
