//
//  ViewController.h
//  RemiindersApp
//
//  Created by Juan Velez Ballesteros on 28/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
@interface ViewController : UIViewController
@property (strong, nonatomic)EKEventStore *eventos;
@property (strong, nonatomic) IBOutlet UIDatePicker *fechaPicker;

@property (strong, nonatomic) IBOutlet UITextField *textoRecordatorio;
- (IBAction)establecerRecordatorio:(id)sender;

@end

