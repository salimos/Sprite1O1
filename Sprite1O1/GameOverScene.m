//
//  GameOverScene.m
//  Sprite1O1
//
//  Created by Slim Khan on 01/11/2013.
//  Copyright (c) 2013 Slim Khan. All rights reserved.
//

#import "GameOverScene.h"
#import "MyScene.h"

@implementation GameOverScene

-(id)initWithSize:(CGSize)size won:(BOOL)won{
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:0 green:0 blue:0 alpha:1];
        NSString * message;
        if (won) {
            message = @"Vous avez gagner :^)";
        }else{
            message = @"Vous avez perdu :(";
        }
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        label.text = message;
        label.fontSize = 32;
        label.fontColor = [SKColor whiteColor];
        label.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:label];
        
        [self runAction:
            [SKAction sequence:@[
             [SKAction waitForDuration:3],
             [SKAction runBlock:^{
                SKTransition *reveal =[SKTransition flipHorizontalWithDuration:1];
                SKScene * myScene = [[MyScene alloc] initWithSize:self.size];
                [self.view presentScene:myScene transition: reveal];
             }]
             ]]
         
        
         ];
        
        
    }
    return self;
}


@end
