//
//  GlobalFunction.h
//  Woc3
//
//  Created by 王卓甫 on 13-11-26.
//  Copyright (c) 2013年 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalFunction : NSObject

+(int) validateInput:(NSString*) text;

+(NSString *)md5:(NSString*)data;

@end
