//
//  WelcomeScene.m
//  Arquiero
//
//  Created by Juan Velez Ballesteros on 07/03/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "WelcomeScene.h"
#import "ArqueroScene.h"
@interface WelcomeScene()
@property BOOL escenaCreada;
@end




@implementation WelcomeScene

-(void) didMoveToView:(SKView *)view{
    if(!self.escenaCreada)
    {
        self.backgroundColor = [SKColor redColor];
        self.scaleMode = SKSceneScaleModeAspectFill;
        [self addChild:[self createWelcomeNode]];
        self.escenaCreada = YES;
    }
    
}

-(SKLabelNode *)createWelcomeNode{
    SKLabelNode *welcomeNode =[SKLabelNode labelNodeWithFontNamed:@"Arial"];
    welcomeNode.name = @"welcomeNode";
    welcomeNode.text =@"Tap para iniciar";
    welcomeNode.fontSize= 44;
    welcomeNode.fontColor =[SKColor blueColor];
    welcomeNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    return welcomeNode;
}

-(void)
touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    SKNode *welcomeNode =[self childNodeWithName:@"welcomeNode"];
    if(welcomeNode != nil){
        SKAction *fadeAway =[SKAction fadeOutWithDuration:1.0];
        
        [welcomeNode runAction:fadeAway completion:^{
            SKScene *aqueroScene =[[ArqueroScene alloc]initWithSize:self.size];
            SKTransition *puerta =[SKTransition doorwayWithDuration:1.0];
            [self.view presentScene:aqueroScene transition:puerta];
        
        }];
    }
    
    
    
    
}

@end
