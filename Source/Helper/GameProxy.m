//
//  GameProxy.m
//  Woc3
//
//  Created by 王卓甫 on 13-11-21.
//  Copyright 2013年 Apportable. All rights reserved.
//

#import "GameProxy.h"

#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

#import "Parms.h"

@implementation GameProxy

+(GameProxy *) sharedProxy
{
    static GameProxy * sharedProxy;
    
    @synchronized(self)
    {
        if (!sharedProxy)
        {
            sharedProxy = [[GameProxy alloc] init];
        }
        
        return sharedProxy;
    }
}

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
    Parms* p = [Parms sharedParms];
    NSString *s = [NSString stringWithFormat:@"%@/%@/%@/%@", p.gBaseAddr , module, function,
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

@end
