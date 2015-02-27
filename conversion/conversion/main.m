//
//  main.m
//  conversion
//
//  Created by Juan Velez Ballesteros on 24/01/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <Foundation/Foundation.h>



double conversionUSDmxp(double usd){
    return usd*14.45;
}

double conversionMxpUSD(double mxp){
    double resultado = mxp/14.45;
    return resultado;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"La conversion de %f usd a pesos es: %f",10.0,conversionUSDmxp(10.0));
        
        NSLog(@"La conversion de %f pesos a dolares es: %f",10.0,conversionMxpUSD(10.0));
    }
    return 0;
}
