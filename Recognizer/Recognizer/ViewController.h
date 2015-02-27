//
//  ViewController.h
//  Recognizer
//
//  Created by Juan Velez Ballesteros on 14/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *etiqueta;
- (IBAction)longPressAction:(id)sender;
- (IBAction)edgeAction:(id)sender;
- (IBAction)pacAction:(id)sender;
- (IBAction)swipe:(id)sender;

@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *rotateAction;
- (IBAction)pinchAction:(id)sender;


- (IBAction)tapAction:(id)sender;

@end

