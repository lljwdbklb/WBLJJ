//
//  LJJOAuthTool.h
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "LJJOAuth.h"
@class LJJOAuth;

@interface LJJOAuthTool : NSObject
shared_interface(LJJOAuthTool)

@property (readonly, nonatomic) LJJOAuth * oauth;
/**
 *  保存OAuth
 *
 *  @param token 用户Token
 *  @param uid   用户UID
 */
- (void)saveOAuthWithToken:(NSString *)token uid:(NSString *)uid;
@end
