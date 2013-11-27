//
//  RegisterScene.m
//  Woc3
//
//  Created by 王卓甫 on 13-11-20.
//  Copyright 2013年 Apportable. All rights reserved.
//

#import "RegisterScene.h"
#import "GlobalFunction.h"
#import "GameProxy.h"
#import "ASIHTTPRequest.h"

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
    
    [self hideErrorMsg];
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
    [self hideErrorMsg];
    NSString* account = tfAccount.textField.text;
    NSString* password = tfPassword.textField.text;
    NSString* repeat = tfRepeat.textField.text;
    NSString* email = tfEmail.textField.text;
    
    //account check
    BOOL bInvalid = FALSE;
    int val = [GlobalFunction validateInput:account];
    bInvalid = bInvalid || (val >0);
    if (val == 1)
    {
        [self showErrorMsg:@"请输入账号！" withLabel:lbAccount];
    }
    else if (val == 2)
    {
        [self showErrorMsg:@"账号不能为空格！" withLabel:lbAccount];
    }
    
    //password check
    val = [GlobalFunction validateInput:password];
    bInvalid = bInvalid || (val > 0);
    if (val == 1)
    {
        [self showErrorMsg:@"请输入密码！" withLabel:lbPassword];
    }
    
    //repeat check
    val = [GlobalFunction validateInput:repeat];
    bInvalid = bInvalid || (val > 0);
    if (val == 1)
    {
        [self showErrorMsg:@"请重复输入密码！" withLabel:lbRepeat];
    }
    
    //password and repeat check
    if (![password isEqualToString:@""] && ![repeat isEqualToString:@""])
    {
        if (![password isEqualToString:repeat])
        {
            bInvalid = TRUE;
            [self showErrorMsg:@"两次输入的密码不一致！" withLabel:lbPassword];
            [self showErrorMsg:@"两次输入的密码不一致！" withLabel:lbRepeat];
        }
    }
    
    //email check
    val = [GlobalFunction validateInput:email];
    bInvalid = bInvalid || (val > 0);
    if (val == 1)
    {
        [self showErrorMsg:@"请输入电子邮件地址！" withLabel:lbEmail];
    }
    
    //invalid input, do not submit.
    if (bInvalid)
    {
        return;
    }
    
    NSString* md5 = [GlobalFunction md5:password];
    
    GameProxy* proxy = [GameProxy sharedProxy];
    NSString* parms = [proxy concatParms:@"/", account, md5, email, nil];
    NSURL* url = [proxy generateUrlWithModule:@"Master" andFunction:@"Register" andParms:parms];
    [proxy setupRequest:url withCompleteDelegate:@selector(requestComplete:) withErrorDelegate:@selector(requestError:) toTarget:self];
}

-(void) requestComplete:(ASIHTTPRequest*)request
{
    NSString* respond = [request responseString];
}

-(void) requestError:(ASIHTTPRequest*)request
{
    NSError* error = [request error];
}

-(void) doBack:(id)sender
{
    [self popScene];
}

-(void) hideErrorMsg
{
    lbAccount.visible = NO;
    lbPassword.visible = NO;
    lbRepeat.visible = NO;
    lbEmail.visible = NO;
}

-(void) showErrorMsg:(NSString*)msg withLabel:(CCLabelTTF*)label
{
    label.visible = TRUE;
    [label setString:msg];
}

@end
