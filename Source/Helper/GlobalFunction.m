//
//  GlobalFunction.m
//  Woc3
//
//  Created by 王卓甫 on 13-11-26.
//  Copyright (c) 2013年 Apportable. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

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
    NSString* space = @" ";
    
    if ([text isEqualToString:empty])
    {
        val = 1;
    }
    else
    {
        range = [text rangeOfString:space];
        if (range.location != NSNotFound)
        {
            val = 2;
        }
    }
    
    return val;
}

+(NSString *)md5:(NSString*)data
{
    const char *cStr = [data UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];    
}
@end
