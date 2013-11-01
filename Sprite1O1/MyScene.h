//
//  MyScene.h
//  Sprite1O1
//

//  Copyright (c) 2013 Slim Khan. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MyScene : SKScene <SKPhysicsContactDelegate> 

@property (nonatomic) SKSpriteNode * player;
@property (nonatomic) SKLabelNode * score;
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@property (nonatomic) int monstersDestroyed;


@end
