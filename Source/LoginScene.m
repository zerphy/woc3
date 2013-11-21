//
//  LoginScene.m
//  Woc3
//
//  Created by 王卓甫 on 13-11-20.
//  Copyright 2013年 Apportable. All rights reserved.
//

#import "LoginScene.h"
#import "CCBuilderReader.h"

@implementation LoginScene

@synthesize tfAccount;
@synthesize tfPassword;

-(id) init
{
    if ((self = [super init]))
    {
        _tfAccount.textField.textColor = [UIColor whiteColor];
    }
    
    return self;
}

-(void) doLogin: (id)sender
{
    NSString* account = _tfAccount.textField.text;
    NSString* password = _tfPassword.textField.text;
}

-(void) doRegister:(id)sender
{
    [self pushScene:@"RegisterScene/RegisterScene"];
}

-(void) doOption:(id)sender
{
}

-(void) pushScene:(NSString*) ccbScene
{
    CCScene* scene = [CCBReader sceneWithNodeGraphFromFile:ccbScene owner:self];
    [[CCDirector sharedDirector] pushScene:scene withTransition:[CCTransition fadeWithColor:ccc3(0, 0, 0) duration:0.5f]];
}

@end
