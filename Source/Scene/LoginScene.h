//
//  LoginScene.h
//  Woc3
//
//  Created by 王卓甫 on 13-11-20.
//  Copyright 2013年 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "CCTextField.h"

@interface LoginScene : CCNode {
    
    CCTextField* _tfAccount;
    CCTextField* _tfPassword;
}

@property (nonatomic, retain) CCTextField* tfAccount;
@property (nonatomic, retain) CCTextField* tfPassword;

//-(void) doLogin: (id)sender;
//-(void) doRegister: (id)sender;
//-(void) doOption: (id)sender;

@end
