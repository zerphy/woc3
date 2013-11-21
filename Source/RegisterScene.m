//
//  RegisterScene.m
//  Woc3
//
//  Created by 王卓甫 on 13-11-20.
//  Copyright 2013年 Apportable. All rights reserved.
//

#import "RegisterScene.h"


@implementation RegisterScene

-(void) popScene
{
    [[CCDirector sharedDirector] popSceneWithTransition:[CCTransition fadeWithColor:ccc3(0, 0, 0) duration:0.5f]];
}

-(void) doFinish:(id)sender
{
    
}

-(void) doBack:(id)sender
{
    [self popScene];
}

@end
