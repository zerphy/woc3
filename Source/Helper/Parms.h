//
//  Parms.h
//  Woc3
//
//  Created by 王卓甫 on 13-11-21.
//  Copyright (c) 2013年 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parms : NSObject
{
    NSString *fontBody;
    NSString *fontName;
    NSString *fontSpecial;
    NSString *fontTips;
    NSString *fontNumber;
    NSString *fontAlphabic;
    
    NSString *gBaseAddr;
    
    NSString *gNet;
    
    NSArray *profArray;
    NSArray *raceArray;
    NSArray *sexArray;
    NSArray *campArray;
    NSArray *itemArray;
    
    NSArray *profNameArray;
    NSArray *raceNameArray;
    NSArray *sexNameArray;
    NSArray *campNameArray;
    NSArray *itemNameArray;
    
    ccColor3B wocYellow;
    ccColor3B wocBlack;
}

@property (retain, nonatomic) NSString *fontBody;
@property (retain, nonatomic) NSString *fontName;
@property (retain, nonatomic) NSString *fontSpecial;
@property (retain, nonatomic) NSString *fontTips;
@property (retain, nonatomic) NSString *fontNumber;
@property (retain, nonatomic) NSString *fontAlphabic;

@property (retain, nonatomic) NSString *gBaseAddr;

@property (retain, nonatomic) NSString *gNet;

@property (retain, nonatomic) NSArray *profArray;
@property (retain, nonatomic) NSArray *raceArray;
@property (retain, nonatomic) NSArray *sexArray;
@property (retain, nonatomic) NSArray *campArray;
@property (retain, nonatomic) NSArray *itemArray;

@property (retain, nonatomic) NSArray *profNameArray;
@property (retain, nonatomic) NSArray *raceNameArray;
@property (retain, nonatomic) NSArray *sexNameArray;
@property (retain, nonatomic) NSArray *campNameArray;
@property (retain, nonatomic) NSArray *itemNameArray;

@property (nonatomic) ccColor3B wocYellow;
@property (nonatomic) ccColor3B wocBlack;


+(Parms *) sharedParms;

-(void) setupParms;
-(void) setupNet: (NSString *) net;

-(ccColor3B) getProfColor:(int) prof;
-(ccColor3B) getItemColor:(int) item;

@end
