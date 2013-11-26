//
//  RegisterScene.m
//  Woc3
//
//  Created by 王卓甫 on 13-11-20.
//  Copyright 2013年 Apportable. All rights reserved.
//

#import "RegisterScene.h"
#import "GlobalFunction.h"


@implementation RegisterScene

@synthesize tfAccount;
@synthesize tfPassword;
@synthesize tfRepeat;
@synthesize tfEmail;

@synthesize lbAccount;
@synthesize lbPassword;
@synthesize lbRepeat;
@synthesize lbEmail;

-(void) onEnter
{
    [super onEnter];
    
    tfAccount.textField.textColor = [UIColor whiteColor];
    tfAccount.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    tfAccount.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tfAccount.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    tfPassword.textField.textColor = [UIColor whiteColor];
    tfPassword.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    tfPassword.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tfPassword.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    tfPassword.textField.secureTextEntry = YES;
    
    tfRepeat.textField.textColor = [UIColor whiteColor];
    tfRepeat.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    tfRepeat.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tfRepeat.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    tfRepeat.textField.secureTextEntry = YES;
    
    tfEmail.textField.textColor = [UIColor whiteColor];
    tfEmail.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    tfEmail.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tfEmail.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    lbAccount.visible = NO;
    lbPassword.visible = NO;
    lbRepeat.visible = NO;
    lbEmail.visible = NO;
}

-(void) onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
}

-(void) popScene
{
    [[CCDirector sharedDirector] popSceneWithTransition:[CCTransition fadeWithColor:ccc3(0, 0, 0) duration:0.5f]];
}

-(void) doFinish:(id)sender
{
    NSString* account = tfAccount.textField.text;
    NSString* password = tfPassword.textField.text;
    NSString* repeat = tfRepeat.textField.text;
    NSString* email = tfEmail.textField.text;
    
    BOOL bInvalid = FALSE;
    int val = [GlobalFunction validateInput:account];
    if (val == 1)
    {
        lbAccount.visible = TRUE;
        [lbAccount setString:@"请输入账号！"];
        bInvalid = TRUE;
    }
    else if (val == 2)
    {
        
    }
    
    
    if (bInvalid)
    {
        return;
    }
}

-(void) doBack:(id)sender
{
    [self popScene];
}

@end
