//
//  GlobalFunction.m
//  Woc3
//
//  Created by 王卓甫 on 13-11-26.
//  Copyright (c) 2013年 Apportable. All rights reserved.
//

#import "GlobalFunction.h"

@implementation GlobalFunction

//0:no error
//1:empty string
//2:space string
+(int) validateInput:(NSString*) text
{
    int val = 0;
    NSRange range;
    NSString* empty = @"";
    
    if ([text isEqualToString:@""])
    {
        val = 1;
    }
    else
    {
        range = [text rangeOfString:empty];
        if (range.location != NSNotFound)
        {
            val = 2;
        }
    }
    
    return val;
}
@end
