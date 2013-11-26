//
//  RegisterScene.h
//  Woc3
//
//  Created by 王卓甫 on 13-11-20.
//  Copyright 2013年 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "CCTextField.h"

@interface RegisterScene : CCNode {
    CCTextField* tfAccount;
    CCTextField* tfPassword;
    CCTextField* tfRepeat;
    CCTextField* tfEmail;
    
    CCLabelTTF* lbAccount;
    CCLabelTTF* lbPassword;
    CCLabelTTF* lbRepeat;
    CCLabelTTF* lbEmail;
}

@property (nonatomic, retain) CCTextField* tfAccount;
@property (nonatomic, retain) CCTextField* tfPassword;
@property (nonatomic, retain) CCTextField* tfRepeat;
@property (nonatomic, retain) CCTextField* tfEmail;

@property (nonatomic, retain) CCLabelTTF* lbAccount;
@property (nonatomic, retain) CCLabelTTF* lbPassword;
@property (nonatomic, retain) CCLabelTTF* lbRepeat;
@property (nonatomic, retain) CCLabelTTF* lbEmail;
      
@end
