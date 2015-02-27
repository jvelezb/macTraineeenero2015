//
//  main.c
//  Multiplicacion
//
//  Created by Juan Velez Ballesteros on 29/11/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[]) {
    int numero = 1;
    printf("El resultado es %d\n", factor(numero ));
    
  
}

//a!
int factor(int a){
    int resultado =0;
    if(a==1){
        return 1;
    }else{
        resultado = a * factor(a-1);
        return resultado;
    }
    
}


