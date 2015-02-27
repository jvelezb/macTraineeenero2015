//
//  MasterViewController.h
//  Split View
//
//  Created by Juan Velez Ballesteros on 24/01/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (nonatomic,retain) NSArray *nombreSitio;
@property(nonatomic,retain)NSArray *direccionSitio;




@end

