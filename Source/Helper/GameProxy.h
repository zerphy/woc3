//
//  GameProxy.h
//  Woc3
//
//  Created by 王卓甫 on 13-11-21.
//  Copyright (c) 2013年 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCLayer;

@interface GameProxy : NSObject

//json methods
-(void) setupRequest:(NSURL *)url withCompleteDelegate:(SEL)complete withErrorDelegate:(SEL)error toTarget:(id)node;
-(NSURL *) generateUrlWithModule:(NSString *)module andFunction:(NSString *)function andParms:(NSString *)parms;
-(id) parseJsonData:(NSString *)data;
-(int) getJsonObjectType:(id) jsonObject;
-(NSString *) concatParms:(NSString *)seperator, ...;
-(NSString *) trimResponseText:(NSString *)response;
-(BOOL) isObjectArray:(id) obj;
-(BOOL) isObjectDict:(id) obj;
-(BOOL) isObjectString:(id) obj;


//tips
-(void) showTips:(CCLayer *)layer withTitle:(NSString *)title;
-(void) hideTips:(CCLayer *)layer;
-(void) changeTips:(CCLayer *)layer withTitle:(NSString *)title;

@end
