//
//  AutoTableViewController.m
//  Poryecto
//
//  Created by Juan Velez Ballesteros on 17/01/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "AutoTableViewController.h"
#import "AutoTableViewCell.h"
#import "ViewController.h"

@interface AutoTableViewController ()

@end

@implementation AutoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _marcas = @[@"Chevy",
                @"BMW",
                @"Toyota",
                @"Volvo",
                @"Smart"];
    _modelos = @[@"Volt",
                 @"Mini",
                 @"Venza",
                 @"S60",
                 @"Fortwo"];
    _imagenes = @[@"chevy_small.jpg",
                  @"mini_small.jpg",
                  @"vw_small.jpg",
                  @"volvo_small.jpg",
                  @"smart_small.jpg"];
    
    
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _marcas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"autoCelda" forIndexPath:indexPath];
    
    // Configure the cell...
    long row = [indexPath row];
    cell.marcaAuto.text =_marcas[row];
    cell.modeloAuto.text = _modelos[row];
    cell.imagenAuto.image = [UIImage imageNamed:_imagenes[row]];
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"mostrarDetalles"]){
        ViewController *destino = [segue destinationViewController];
        
        NSIndexPath *indice =[self.tableView indexPathForSelectedRow];
        long row =[indice row];
        destino.detalleAuto = @[_marcas[row],_modelos[row],_imagenes[row]];
        
        
    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
