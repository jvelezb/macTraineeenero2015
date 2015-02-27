//
//  Mamifero.h
//  Clase2 Proyecto 1
//
//  Created by Juan Velez Ballesteros on 06/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import "Animal.h"

@interface Mamifero : Animal{
    int pelos;
    Boolean *acuatico;
}
-(void)setPelos: (int)numeroPelos siEsdeAgua: (Boolean *)agua;
-(int)getPelos;
-(Boolean *)getAcuatico;
-(NSString *)amamantan;




@end
