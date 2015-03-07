//
//  Segunda.h
//  RemiindersApp
//
//  Created by Juan Velez Ballesteros on 28/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Segunda : UIViewController
@property (strong, nonatomic) EKEventStore *eventStore;
@property (strong, nonatomic) IBOutlet UITextField *eventoText;
@property (strong, nonatomic) CLLocationManager *manager;
- (IBAction)boton:(id)sender;

@end
