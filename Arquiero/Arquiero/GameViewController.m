//
//  GameViewController.m
//  Arquiero
//
//  Created by Juan Velez Ballesteros on 07/03/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "GameViewController.h"
#import "WelcomeScene.h"





@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SKView *vista =(SKView *)self.view;
    vista.showsFPS = YES;
    vista.showsNodeCount = YES;
    WelcomeScene *bienvenido = [[WelcomeScene alloc] initWithSize:CGSizeMake(vista.bounds.size.width, vista.bounds.size.height)];
    [vista presentScene:bienvenido];

  
}

- (void) handleTap:(UIGestureRecognizer*)gestureRecognize
{
}



- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
