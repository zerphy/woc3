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
        self.gBaseAddr = @"http://192.168.5.192:9998";
    }
}

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
