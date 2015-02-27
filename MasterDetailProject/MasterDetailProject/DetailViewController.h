//
//  DetailViewController.h
//  MasterDetailProject
//
//  Created by Juan Velez Ballesteros on 24/01/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UISplitViewControllerDelegate>


@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *etiqueta;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;


@end

