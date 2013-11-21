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


-(void)onEnter
{
    tfAccount.textField.textColor = [UIColor whiteColor];
    tfAccount.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    tfAccount.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tfAccount.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //tfAccount.textField.returnKeyType = UIReturnKeyNext;
    
    tfPassword.textField.textColor = [UIColor whiteColor];
    tfPassword.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    tfPassword.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tfPassword.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //tfPassword.textField.returnKeyType = UIReturnKeyDone;
    tfPassword.textField.secureTextEntry = YES;
}

-(void) doLogin: (id)sender
{
    NSString* account = tfAccount.textField.text;
    NSString* password = tfPassword.textField.text;
    
    if ([account isEqualToString:@"a"] && [password isEqualToString:@"a"])
    {
        
    }
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
