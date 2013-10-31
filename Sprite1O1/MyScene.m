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
        self.player.position = CGPointMake(100, 100);
        [self addChild:self.player];
        
    }
    return self;
}

@end
