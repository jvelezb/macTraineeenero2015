//
//  CarTableViewController.m
//  TableViewStory
//
//  Created by Neil Smyth on 9/17/13.
//  Copyright (c) 2013 Neil Smyth. All rights reserved.
//

#import "CarTableViewController.h"
#import "CarTableViewCell.h"
#import "CarDetailViewController.h"

@interface CarTableViewController ()

@end

@implementation CarTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     _carMakes = @[@"Chevy",
                  @"BMW",
                  @"Toyota",
                  @"Volvo",
                  @"Smart"];

    _carModels = @[@"Volt",
                   @"Mini",
                   @"Venza",
                   @"S60",
                   @"Fortwo"];

    _carImages = @[@"chevy_volt.jpg",
                   @"mini_clubman.jpg",
                   @"toyota_venza.jpg",
                   @"volvo_s60.jpg",
                   @"smart_fortwo.jpg"];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowCarDetails"])
    {
        CarDetailViewController *detailViewController =
           [segue destinationViewController];

        NSIndexPath *myIndexPath = [self.tableView
           indexPathForSelectedRow];

        long row = [myIndexPath row];

        detailViewController.carDetailModel = @[_carMakes[row],
        _carModels[row], _carImages[row]];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _carModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"carTableCell";
    CarTableViewCell *cell = [tableView 
          dequeueReusableCellWithIdentifier:CellIdentifier 
          forIndexPath:indexPath];

    // Configure the cell...

    long row = [indexPath row];

    cell.modelLabel.text = _carModels[row];
    cell.makeLabel.text = _carMakes[row];
    cell.carImage.image = [UIImage imageNamed:_carImages[row]];

    return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
