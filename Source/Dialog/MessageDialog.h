//
//  MessageDialog.h
//  Woc3
//
//  Created by 王卓甫 on 13-11-27.
//  Copyright 2013年 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MessageDialog : CCNode {
    NSInvocation* callback;
    CCButton* button;
    BOOL touchButton;
}

-(id) initMessage:(NSString *)message withTitle:(NSString *)title target:(id)calbackObj selector:(SEL)selector showButton:(BOOL)showed;

-(void) removeDialog;

@end
