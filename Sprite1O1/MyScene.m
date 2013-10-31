//
//  MyScene.m
//  Sprite1O1
//
//  Created by Slim Khan on 31/10/2013.
//  Copyright (c) 2013 Slim Khan. All rights reserved.
//

#import "MyScene.h"




@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        // 2
        NSLog(@"Size: %@", NSStringFromCGSize(size));
        
        // 3
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1 blue:1.0 alpha:1.0];
        
        // 4
        self.player = [SKSpriteNode spriteNodeWithImageNamed:@"player"];
        self.player.position = CGPointMake(self.player.size.width/2, self.frame.size.height/2);
        [self addChild:self.player];
        
    }
    return self;
}

-(void)addMonster {
    SKSpriteNode * monster = [SKSpriteNode spriteNodeWithImageNamed:@"monster"];
    
    
    int minY = monster.size.height / 2;
    int maxY = self.frame.size.height - monster.size.height / 2;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    monster.position = CGPointMake(self.frame.size.width + monster.size.width/2, actualY);
    [self addChild:monster];
    
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangDuration = maxDuration - minDuration;
    int actualDuration = (arc4random()%rangDuration)+minDuration;
    
    SKAction * actionMove = [SKAction moveTo:CGPointMake(-monster.size.width/2, actualY) duration:actualDuration];
    SKAction * actionMoveDone = [SKAction removeFromParent];
    
    [monster runAction:[SKAction sequence:@[actionMove,actionMoveDone]]];
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    if (self.lastSpawnTimeInterval > 1) {
        self.lastSpawnTimeInterval = 0;
        [self addMonster];
        //NSLog(@"A new monster just added");
    }
}

- (void)update:(NSTimeInterval)currentTime{
    // Handle time delta.
    // If we drop below 60fps, we still want everything to move the same distance.
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];
}

@end
