//
//  MessageDialog.m
//  Woc3
//
//  Created by 王卓甫 on 13-11-27.
//  Copyright 2013年 Apportable. All rights reserved.
//

#import "MessageDialog.h"


@implementation MessageDialog

-(id) initMessage:(NSString *)message withTitle:(NSString *)title target:(id)callbackObj selector:(SEL)selector showButton:(BOOL)showed
{
    if ((self = [super init]))
    {
        /*CGSize size = [[CCDirector sharedDirector] winSize];
        float xc = size.width/2;
        float yc = size.height/2;
        
        GameProxy *proxy = [GameProxy sharedProxy];
        
        if (callbackObj && selector)
        {
            NSMethodSignature *sig = [callbackObj methodSignatureForSelector:selector];
            callback = [NSInvocation invocationWithMethodSignature:sig];
            [callback setTarget:callbackObj];
            [callback setSelector:selector];
            [callback retain];
        }
        
        CCSprite *bg = [CCSprite spriteWithFile:@"dialog.png"];
        bg.position = ccp(xc, yc);
        [self addChild:bg z:0 tag:0];
        
        if (!showed)
        {
            LoadingSprite *loading = [LoadingSprite node];
            [loading loadTextures];
            loading.position = ccp(xc + 100, yc + 50);
            loading.scale = 0.4f;
            [self addChild:loading z:1 tag:1];
        }
        
        CCLabelTTF *labelTitle = [CCLabelTTF labelWithString:title fontName:proxy.fontTips fontSize:32];
        labelTitle.position = ccp(xc, yc + 50);
        labelTitle.color = proxy.wocBlack;
        [self addChild:labelTitle z:2 tag:2];
        
        CCLabelTTF *labelMessage = [CCLabelTTF labelWithString:message fontName:proxy.fontName fontSize:14];
        labelMessage.position = ccp(xc, yc);
        labelMessage.color = proxy.wocBlack;
        [self addChild:labelMessage z:3 tag:3];
        
        if (showed)
        {
            CCMenuItemImage *btn = [CCMenuItemImage itemWithNormalImage:@"woc-button-confirm.png" selectedImage:@"woc-button-confirm-p.png" target:self selector:@selector(onOKButton:)];
            menu = [CCMenu menuWithItems:btn, nil];
            menu.position = ccp(xc, yc - 50);
            [self addChild:menu z:4 tag:4];
        }
        self.scale = 0.0f;
        CCScaleTo *scale = [CCScaleTo actionWithDuration:0.1f scale:1.0f];
        [self runAction:scale];*/
    }
    
    return self;
}

/*-(void) dealloc
{
    //[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    [callback release];
    [super dealloc];
}*/

-(void) onOKButton:(id) sender
{
    [[[CCDirector sharedDirector] ] removeDelegate:self];
    if (callback)
    {
        [callback invoke];
    }
    [self removeFromParentAndCleanup:YES];
}

-(void) removeDialog
{
    [[[CCDirector sharedDirector] responderManager] :self];
    if (callback)
    {
        [callback invoke];
    }
    [self removeFromParentAndCleanup:YES];
}

-(void) onEnter
{
    [super onEnter];
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:kCCMenuHandlerPriority - 1 swallowsTouches:true];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (menu)
    {
        touchedMenu = [menu ccTouchBegan:touch withEvent:event];
    }
    return true;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (menu)
    {
        if (touchedMenu)
        {
            [menu ccTouchMoved:touch withEvent:event];
        }
    }
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (menu)
    {
        if (touchedMenu)
        {
            [menu ccTouchEnded:touch withEvent:event];
            touchedMenu = FALSE;
        }
    }
}

-(void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (menu)
    {
        if (touchedMenu)
        {
            [menu ccTouchCancelled:touch withEvent:event];
            touchedMenu = FALSE;
        }
    }
}
@end
