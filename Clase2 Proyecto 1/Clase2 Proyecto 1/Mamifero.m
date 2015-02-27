//
//  Mamifero.m
//  Clase2 Proyecto 1
//
//  Created by Juan Velez Ballesteros on 06/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import "Mamifero.h"

@implementation Mamifero
-(void)setPelos: (int)numeroPelos siEsdeAgua: (Boolean *)agua{
    pelos = numeroPelos;
    acuatico = agua;
    
    
}
-(int)getPelos{
    return pelos;
}
-(Boolean *)getAcuatico{
    return acuatico;
    
}
-(NSString *)amamantan{
    return @"Esta amamantando";
    
}


@end
