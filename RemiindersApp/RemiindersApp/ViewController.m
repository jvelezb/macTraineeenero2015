//
//  ViewController.m
//  RemiindersApp
//
//  Created by Juan Velez Ballesteros on 28/02/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
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

- (IBAction)establecerRecordatorio:(id)sender {
    if(_eventos == nil){
        _eventos =[[EKEventStore alloc]init];
        [_eventos requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
            if(!granted){
                NSLog(@"Acceso al almaceno disponible");
            }
        }];
    }
    if(_eventos!=nil){
        [self  crearRecordatorio];
    }
    
}
-(void)crearRecordatorio{
    EKSource *localSource;
    for (EKSource *source in self.eventos.sources)
    {
        if (source.sourceType == EKSourceTypeCalDAV &&
            [source.title isEqualToString:@"iCloud"])
        {
            localSource = source;
            break;
        }
    }
    
    
    
    EKReminder *recordatorio =[EKReminder reminderWithEventStore:self.eventos];
    recordatorio.title = _textoRecordatorio.text;
    recordatorio.calendar = [_eventos defaultCalendarForNewReminders];
    recordatorio.calendar = 
    NSDate *fecha =[_fechaPicker date];
    
    EKAlarm *alarma = [EKAlarm alarmWithAbsoluteDate:fecha];
    [recordatorio addAlarm:alarma];
    NSError *error = nil;
    
    [_eventos saveReminder:recordatorio commit:YES error:&error];
    if(error )
        NSLog(@"Error %@",error);
}

@end
