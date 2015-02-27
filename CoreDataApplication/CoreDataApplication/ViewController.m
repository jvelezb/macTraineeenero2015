//
//  ViewController.m
//  CoreDataApplication
//
//  Created by Juan Velez Ballesteros on 14/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)guardar:(id)sender {
    AppDelegate *appDelegate =[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *contactoNuevo = [NSEntityDescription insertNewObjectForEntityForName:@"Contacto" inManagedObjectContext:context];
    [contactoNuevo setValue:_nombre.text forKey:@"nombre"];
    [contactoNuevo setValue:_direccion.text forKey:@"direccion"];
    [contactoNuevo setValue:_telefono.text  forKey:@"telefono"];
    _nombre.text =@"";
    _direccion.text =@"";
    _telefono.text =@"";
    NSError *error;
    [context save:&error];
    NSLog(error);
    
}

- (IBAction)buscar:(id)sender {
    AppDelegate *appDelegate =[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];

    NSEntityDescription *entityDescription =[NSEntityDescription entityForName:@"Contacto" inManagedObjectContext:context];
    NSFetchRequest *request =[[NSFetchRequest alloc]init];
    [request setEntity:entityDescription];
    
    NSPredicate *pred =[NSPredicate predicateWithFormat:@"(nombre = %@)",_nombre.text];
    [request setPredicate:pred];
    NSManagedObject *contactosEncontrados = nil;
    
    NSError *error;
    NSArray *objetos =[context executeFetchRequest:request error:&error];
    if([objetos count] == 0){
        /// no existe
    }else {
        contactosEncontrados =objetos[0];
        _direccion.text = [contactosEncontrados valueForKey:@"direccion" ];
        _telefono.text = [contactosEncontrados valueForKey:@"telefono"];
                           
    }
    
}
@end
