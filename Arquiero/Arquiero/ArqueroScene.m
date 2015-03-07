//
//  ArqueroScene.m
//  Arquiero
//
//  Created by Juan Velez Ballesteros on 07/03/15.
//  Copyright (c) 2015 Juan Velez. All rights reserved.
//

#import "ArqueroScene.h"
#import "WelcomeScene.h"

@interface ArqueroScene()
@property BOOL escenaCreada;
@property int puntuacion;
@property int cuentaBalones;
@property NSArray *animacionArquero;
@end

@implementation ArqueroScene

static const uint32_t categoria_flecha = 0x1 << 0;
static const uint32_t categoria_pelota = 0x1 <<1;

-(void)didMoveToView:(SKView *)view{
    if(!self.escenaCreada){
        self.puntuacion = 0;
        self.cuentaBalones = 100;
      
        self.physicsWorld.gravity = CGVectorMake(0.05, -5.0);
        self.physicsWorld.contactDelegate =self;
        
        [self initWithArqueros];
        self.escenaCreada = YES;
    }
}


-(void)initWithArqueros{
    self.backgroundColor = [SKColor grayColor];
    self.scaleMode = SKSceneScaleModeAspectFill;
    SKSpriteNode *nodoArquero =[self createArquero];
    nodoArquero.position =CGPointMake(CGRectGetMinX(self.frame)+55, CGRectGetMidY(self.frame));
    [self addChild:nodoArquero];
    
    NSMutableArray *framesArquero =[NSMutableArray array];
    SKTextureAtlas *atlasAquero =[SKTextureAtlas atlasNamed:@"archer"];
    for(int i = 1; i<=atlasAquero.textureNames.count; i++){
        NSString *textura =[NSString stringWithFormat:@"archer%03d",i];
        
        [framesArquero addObject:[atlasAquero textureNamed:textura]];
    }
    self.animacionArquero = framesArquero;
    SKAction *dejarCaerPelotas =[SKAction sequence:@[[SKAction performSelector:@selector(crearNodoPelota) onTarget:self ],[SKAction waitForDuration:0.3]] ];
    [self runAction:[SKAction repeatAction:dejarCaerPelotas count:self.cuentaBalones] completion:^{
        [self gameOver];
    }];
}


-(SKSpriteNode *)createArquero{
    SKSpriteNode *nodoArquero =[[SKSpriteNode alloc]initWithImageNamed:@"archer001.png"];
    nodoArquero.name =@"nodoArquero";
    return nodoArquero;
}

-(void)
touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    SKNode *nodoArquero =[self childNodeWithName:@"nodoArquero"];
    if(nodoArquero != nil){
        SKAction *animacion =[SKAction animateWithTextures:self.animacionArquero timePerFrame:0.05];
        SKAction *disparo =[SKAction runBlock:^{
            SKNode *flecha = [self crearNodoFlecha];
            [self addChild:flecha];
            [flecha.physicsBody applyImpulse:CGVectorMake(35.0,20.0)];
        }];
        SKAction *secuencia =[SKAction sequence:@[animacion,disparo]];
        [nodoArquero runAction:secuencia];
        
    }
}
-(SKSpriteNode *)crearNodoFlecha{
    SKSpriteNode *flecha =[[SKSpriteNode alloc]initWithImageNamed:@"ArrowTexture.png"];
    flecha.position = CGPointMake(CGRectGetMinX(self.frame)+100, CGRectGetMidY(self.frame));
    flecha.name = @"nodoFlecha";
    flecha.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:flecha.frame.size];
    flecha.physicsBody.usesPreciseCollisionDetection =YES;
    flecha.physicsBody.categoryBitMask = categoria_flecha;
    flecha.physicsBody.collisionBitMask =categoria_flecha |categoria_pelota;
    flecha.physicsBody.contactTestBitMask =categoria_pelota |categoria_flecha;
    return flecha;
    }


-(void)crearNodoPelota{
    SKSpriteNode *pelota =[[SKSpriteNode alloc]initWithImageNamed:@"BallTexture.png"];
    pelota.position =CGPointMake(randomBetween(200,self.size.width),self.size.height-50);
    pelota.name=@"nodoPelota";
    pelota.physicsBody.categoryBitMask = categoria_pelota;
    pelota.physicsBody =[SKPhysicsBody bodyWithCircleOfRadius:(pelota.size.width/2)-7];
    pelota.physicsBody.usesPreciseCollisionDetection = YES;
    [self addChild:pelota];
                                 
}

static inline CGFloat randomFloat(){
    return rand()/(CGFloat) RAND_MAX;
}
static inline CGFloat randomBetween(CGFloat low, CGFloat high){
    return randomFloat()*(high-low)+low;
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    SKSpriteNode *primerNodo, *segundoNodo;
    primerNodo =(SKSpriteNode *)contact.bodyA.node;
    segundoNodo =(SKSpriteNode *)contact.bodyB.node;
    
    
        CGPoint contactPoint = contact.contactPoint;
        float contact_x = contactPoint.x;
        float contact_y = contactPoint.y;
        float target_y= segundoNodo.position.y;
        float target_x= segundoNodo.position.x;
        float margen = segundoNodo.frame.size.height /2-25;
        
        if((contact_y > (target_y-margen))&&(contact_y <target_y+margen)){
            SKPhysicsJointFixed *joint =[SKPhysicsJointFixed jointWithBodyA:contact.bodyA bodyB:contact.bodyB anchor:CGPointMake(contact_x, contact_y)];
            [self.physicsWorld addJoint:joint];
            SKTexture *textura = [SKTexture textureWithImageNamed:@"ArrowHitTexture.png"];
            primerNodo.texture = textura;
            NSString *burstPath =[[NSBundle mainBundle]pathForResource:@"MyParticle" ofType:@"sks"];
            SKEmitterNode *burstNode = [NSKeyedUnarchiver unarchiveObjectWithFile:burstPath];
            burstNode.position =CGPointMake(target_x, target_y);
            [segundoNodo removeFromParent];
            [self addChild:burstNode];
            NSLog(@"le pegue a la pelota");
            self.puntuacion++;
        }
    
}

-(SKLabelNode *)crearNodoPuntuacion{
    SKLabelNode *scoreNode =[SKLabelNode labelNodeWithFontNamed:@"Times New Roman"];
    scoreNode.name =@"puntuacionNode";
    NSString *puntuacionNueva=[NSString stringWithFormat:@"Puntacion: %i ",self.puntuacion];
    scoreNode.text = puntuacionNueva;
    scoreNode.fontSize = 60;
    scoreNode.fontColor = [SKColor redColor];
    scoreNode.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    return scoreNode;
    
}
-(void)gameOver{
    SKLabelNode *scoreNode =[self crearNodoPuntuacion];
    [self addChild:scoreNode];
    SKAction *fadeOut =[SKAction sequence:@[[SKAction waitForDuration:3.0],[SKAction fadeOutWithDuration:3.0]]];
    SKAction *welcomeReturn =[SKAction runBlock:^{
        SKTransition *transition =[SKTransition revealWithDirection:SKTransitionDirectionDown duration:1.0];
        WelcomeScene *welcomeScene=[[WelcomeScene alloc]initWithSize:self.size];
        [self.scene.view presentScene:welcomeScene transition:transition];
        
    }];
    SKAction *secuencia =[SKAction sequence:@[fadeOut, welcomeReturn]];
    [self runAction:secuencia];
}

@end
