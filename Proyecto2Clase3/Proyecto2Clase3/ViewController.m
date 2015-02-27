//
//  ViewController.m
//  Proyecto2Clase3
//
//  Created by Juan Velez Ballesteros on 13/12/14.
//  Copyright (c) 2014 Juan Velez. All rights reserved.
//

#import "ViewController.h"

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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"el boton selecionado es %@",[alertView buttonTitleAtIndex:buttonIndex]);
    
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];
    
    [NSThread sleepForTimeInterval:2.0];
   // exit(0);
}

- (IBAction)botonAction:(id)sender {
    NSString *loqueVieneTextField = [_campoEntrada text];//_campoEntrada.text;
    NSString *numer1 = _campoEntrada.text;
    int num = [numer1 intValue]+1;
    _etiqueta.text = [NSString stringWithFormat:@"%d",num];
    UIAlertView *alerta =[[UIAlertView alloc] initWithTitle:@"El resultado" message:_etiqueta.text delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    [alerta show];
     
}
-(IBAction)textFieldReturn:(id)sender{
    [sender resignFirstResponder];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch =[[event allTouches]anyObject];
    if([_campoEntrada isFirstResponder] && [touch view]!=_campoEntrada){
        [_campoEntrada resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event ];
}


@end
