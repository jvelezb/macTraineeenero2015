//
//  Dibijo2D.m
//  Dibujos2D
//
//  Created by Juan Velez Ballesteros on 28/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "Dibijo2D.h"

@implementation Dibijo2D

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIImage *miImagen = [UIImage imageNamed:@"tree.jpg"];
    CIImage *cimage =[[CIImage alloc]initWithImage:miImagen];
    
    CIFilter *filtro =[CIFilter filterWithName:@"CIPhotoEffectMono"];
    [filtro setDefaults];
    [filtro setValue:cimage forKey:@"inputImage"];
    //[filtro setValue:[NSNumber numberWithFloat:0.8f] forKey:@"inputIntensity"];
    CIImage *imagen =[filtro outputImage];
    CIContext *context =[CIContext contextWithOptions:nil];
    CGImageRef cgImage =[context createCGImage:imagen fromRect:imagen.extent];
    UIImage *resultado =[UIImage imageWithCGImage:cgImage];
    CGRect imageRect = [[UIScreen mainScreen]bounds];
    [resultado drawInRect:imageRect];
    
}


@end
