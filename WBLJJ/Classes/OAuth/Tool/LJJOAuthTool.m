//
//  LJJOAuthTool.m
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJOAuthTool.h"
#import "LJJOAuth.h"

#define kDocumentFilePath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
#define kTokenPath @"oauth.data"

#define kTokenFile [kDocumentFilePath stringByAppendingPathComponent:kTokenPath]

@implementation LJJOAuthTool
shared_implement(LJJOAuthTool)

- (id)init {
    if (self = [super init]) {
        _oauth = [NSKeyedUnarchiver unarchiveObjectWithFile:kTokenFile];
    }
    return self;
}

-(void)saveOAuthWithToken:(NSString *)token uid:(NSString *)uid {
    LJJOAuth * oAuth = [[LJJOAuth alloc]init];
    oAuth.token = token;
    oAuth.uid = uid;
    _oauth = oAuth;
    
    //保存到沙盒中
    [NSKeyedArchiver archiveRootObject:oAuth toFile:kTokenFile];
}
@end
