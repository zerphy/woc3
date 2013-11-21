//
//  Parms.m
//  Woc3
//
//  Created by 王卓甫 on 13-11-21.
//  Copyright (c) 2013年 Apportable. All rights reserved.
//

#import "Parms.h"

@implementation Parms

@synthesize fontBody;
@synthesize fontName;
@synthesize fontSpecial;
@synthesize fontTips;
@synthesize fontNumber;
@synthesize fontAlphabic;

@synthesize gBaseAddr;

@synthesize gNet;

@synthesize profArray;
@synthesize raceArray;
@synthesize sexArray;
@synthesize campArray;
@synthesize itemArray;

@synthesize profNameArray;
@synthesize raceNameArray;
@synthesize sexNameArray;
@synthesize campNameArray;
@synthesize itemNameArray;

@synthesize wocYellow;
@synthesize wocBlack;

//classes colors
static ccColor3B profColors[] = {
    {199, 156, 110},
    {245, 140, 186},
    {171, 212, 115},
    {255, 245, 105},
    {255, 255, 255},
    { 36,  89, 255},
    {105, 204, 240},
    {148, 130, 202},
    { 45, 155, 120},
    {255, 125,  10},
    {196,  30,  59}
};

//item colors
static ccColor3B itemColors[] =
{
    {157, 157, 157},    //poor
    {255, 255, 255},    //common
    { 30, 255,   0},    //uncommon
    {  0, 129, 255},    //rare
    {198,   0, 255},    //epic
    {255, 128,   0},    //legendary
    {229, 204, 128},    //artifact
    {229, 204, 128}     //heirloom
};


+(Parms *) sharedParms
{
    static Parms * sharedProxy;
    
    @synchronized(self)
    {
        if (!sharedProxy)
        {
            sharedProxy = [[Parms alloc] init];
        }
        
        return sharedProxy;
    }
}

-(void) setupParms
{
    self.fontBody = @"HYe3gj";
    //self.fontName = @"HYo1gj";
    self.fontName = @"STHeitiSC-Light";
    self.fontSpecial = @"HYj1gf";
    self.fontTips = @"FZLSJW--GB1-0";
    
    self.fontNumber = @"Copperplate";
    self.fontAlphabic = @"MarkerFelt-Thin";
    
    [self setupNet:@"intranet"];
    
    
    profArray = [NSArray
                  arrayWithObjects:@"warrior", @"paladin", @"hunter", @"rogue", @"priest",
                  @"shaman", @"mage", @"warlock", @"monk", @"druid", @"dk", nil];
    
    raceArray = [NSArray arrayWithObjects: @"human", @"dwarf", @"darkelf",
                  @"gnome", @"draenei", @"worgen", @"orc", @"scourge",
                  @"tauren", @"troll", @"bloodelf", @"goblin", @"pandaren", nil];
    
    sexArray = [NSArray arrayWithObjects:@"male", @"female", nil];
    
    campArray = [NSArray arrayWithObjects:@"alliance", @"horde", nil];
    
    itemArray = [NSArray
                  arrayWithObjects:@"poor", @"common", @"uncommon", @"rare",
                  @"epic", @"legendary", @"artifact", @"heirloom", nil];
    
    profNameArray = [NSArray
                      arrayWithObjects:@"战士", @"圣骑士", @"猎人", @"盗贼", @"牧师",
                      @"萨满", @"法师", @"术士", @"武僧", @"德鲁伊", @"死亡骑士", nil];
    
    raceNameArray = [NSArray arrayWithObjects: @"人类", @"矮人", @"暗夜精灵",
                      @"侏儒", @"德莱尼", @"狼人", @"兽人", @"亡灵",
                      @"牛头人", @"巨魔", @"血精灵", @"地精", @"熊猫人", nil];
    
    sexNameArray = [NSArray arrayWithObjects:@"男", @"女", nil];
    
    campNameArray = [NSArray arrayWithObjects:@"联盟", @"部落", nil];
    
    itemArray = [NSArray
                  arrayWithObjects:@"粗糙", @"普通", @"优秀", @"精良",
                  @"史诗", @"传说", @"神器", @"逆天", nil];
    
    self.wocYellow = ccc3(255, 241, 0);
    self.wocBlack = ccc3(0, 0, 0);
}

-(void) setupNet: (NSString *) net;
{
    self.gNet = net;
    
    if ([self.gNet isEqualToString:@"internet"])
    {
        //internet
        self.gBaseAddr = @"http://10.211.55.3:8000";
    }
    else if ([self.gNet isEqualToString:@"intranet"])
    {
        //intranet
        self.gBaseAddr = @"http://192.168.5.199:8000";
    }
}

/*
//setup request parameters
-(void) setupRequest:(NSURL *)url withCompleteDelegate:(SEL)complete withErrorDelegate:(SEL)error toTarget:(id)node
{
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"text/xml; charset=utf-8"];
    [request addRequestHeader:@"Content-Length" value:@"0"];
    [request setRequestMethod:@"GET"];
    //[request appendPostData:[soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setDidFinishSelector:complete];
    [request setDidFailSelector:error];
    
    [request setDelegate:node];
    [request startAsynchronous];
}

-(NSURL *) generateUrlWithModule:(NSString *)module andFunction:(NSString *)function andParms:(NSString *)parms
{
    NSString *s = [NSString stringWithFormat:@"%@/%@/%@/%@", gBaseAddr, module, function,
                   [parms stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:s];
    return  url;
}

-(id) parseJsonData:(NSString *)jsonText
{
    NSData *data = [jsonText dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    return  jsonObject;
}

-(int) getJsonObjectType:(id) jsonObject
{
    int type = 0;
    if (jsonObject != nil)
    {
        if ([jsonObject isKindOfClass:[NSDictionary class]])
        {
            //NSDictionary *dict = (NSDictionary *)jsonObject;
            type = 1;
        }
        else if ([jsonObject isKindOfClass:[NSArray class]])
        {
            //NSArray *array = (NSArray *)jsonObject;
            type = 2;
        }
        else
        {
            //NSString *s = (NSString *)jsonObject;
        }
    }
    return type;
}

-(NSString *) concatParms:(NSString *)seperator, ...
{
    id element;
    va_list args;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    if (seperator)
    {
        va_start(args, seperator);
        while ((element = va_arg(args, id)))
        {
            [array addObject:element];
        }
        va_end(args);
    }
    
    NSString *value = nil;
    
    int count = [array count];
    if (count == 0)
    {
        value = nil;
    }
    else
    {
        NSMutableString *s = [[NSMutableString alloc] init];
        for (int i = 0; i < count; i++)
        {
            [s appendFormat:@"%@", [array objectAtIndex:i]];
            if (i < (count - 1))
            {
                [s appendString:seperator];
            }
        }
        value = s;
    }
    
    return value;
}

-(NSString *) trimResponseText:(NSString *)response
{
    NSString *json = response;
    //NSString *s  = [response stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    //s = [s stringByReplacingOccurrencesOfString:@"[" withString:@""];
    //s = [s stringByReplacingOccurrencesOfString:@"]" withString:@""];
    //NSRange range = NSMakeRange(1, s.length - 2);
    //s = [s substringWithRange:range];
    
    json = [json stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    json = [json stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    json = [json stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:@""];
    int lastChar = [json length]-1;
    json = [json stringByReplacingCharactersInRange:NSMakeRange(lastChar,1) withString:@""];
    json = [json stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    
    return json;
}

-(BOOL) isObjectArray:(id) obj
{
    return [obj isKindOfClass:[NSArray class]];
}

-(BOOL) isObjectDict:(id) obj
{
    return [obj isKindOfClass:[NSDictionary class]];
}

-(BOOL) isObjectString:(id) obj
{
    return [obj isKindOfClass:[NSString class]];
}

//show tips
-(void) showTips:(CCLayer *)layer withTitle:(NSString *)title
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    CCSprite *mask = [CCSprite spriteWithFile:@"woc-trans-mask.png"];
    mask.position = CGPointMake(size.width/2, size.height/2);
    [layer addChild:mask z:Z_MASK tag:TAG_MASK];
    
    CCSprite *bg = [CCSprite spriteWithFile:@"woc-tips-bg.png"];
    bg.position = CGPointMake(-size.width/2, size.height/2);
    [layer addChild:bg z:Z_TIPS tag:TAG_TIPS];
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:title fontName:self.fontTips fontSize:48];
    label.position = CGPointMake(-size.width/2, size.height/2);
    label.color = ccc3(255, 241, 0);
    [layer addChild:label z:Z_TITLE tag:TAG_TITLE];
    
    CCMoveTo *moveTo = [CCMoveTo actionWithDuration:0.1f position:CGPointMake(size.width/2, size.height/2)];
    [label runAction:moveTo];
    CCMoveTo *moveTo2 = [CCMoveTo actionWithDuration:0.1f position:CGPointMake(size.width/2, size.height/2)];
    [bg runAction:moveTo2];
}

-(void) hideTips:(CCLayer *)layer
{
    [layer removeChildByTag:TAG_MASK];
    [layer removeChildByTag:TAG_TIPS];
    [layer removeChildByTag:TAG_TITLE];
}

-(void) changeTips:(CCLayer *)layer withTitle:(NSString *)title
{
    CCLabelTTF *label = (CCLabelTTF *)[layer getChildByTag:TAG_TITLE];
    if (label)
    {
        [label setString:title];
    }
}

//account
-(void) saveLoginName:(NSString *)loginName
{
    self.account.loginName = loginName;
}  */

-(ccColor3B) getProfColor:(int) prof
{
    if ((prof < 0) || (prof > profArray.count))
    {
        return ccc3(0, 0, 0);
    }
    return profColors[prof];
}

-(ccColor3B) getItemColor:(int) item
{
    if ((item < 0) || (item > itemArray.count))
    {
        return ccc3(0, 0, 0);
    }
    return itemColors[item];
}

@end
