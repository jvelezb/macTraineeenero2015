//
//  ViewController.m
//  practica2
//
//  Created by Juan Velez Ballesteros on 20/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import "ViewController.h"
#import "Escena2ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Escena2ViewController *destino =[segue destinationViewController];
    destino.textoDeEntrada = _entrada.text;
}

-(IBAction)returned:(UIStoryboardSegue *)segue
{
    _entrada.text = @"Ya regrese";
}

-(IBAction)sdd:(UIStoryboardSegue *)segue
{
    _entrada.text = @"Nunca me fui";
}
@end
