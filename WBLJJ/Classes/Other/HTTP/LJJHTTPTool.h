//
//  LJJHTTPTool.h
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HTTPSuccess)(id json);
typedef void(^HTTPFailure)(NSError * error,id json);

@interface LJJHTTPTool : NSObject
shared_interface(LJJHTTPTool)
/**
 *  生成Request
 *
 *  @param baseURL    根路径
 *  @param method     请求方式
 *  @param path       子地址
 *  @param parameters 参数
 *
 *  @return 返回NSURLRequest
 */
- (NSURLRequest *)requestWithBaseURL:(NSString *)baseURL method:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters;
/**
 *  get请求Json
 *
 *  @param baseURL    根路径
 *  @param path       子地址
 *  @param parameters 参数
 *  @param success    成功Block 回调
 *  @param failure    失败Block 回调
 */
- (void)getJsonWithBaseURL:(NSString *)baseURL path:(NSString *)path parameters:(NSDictionary *)parameters success:(HTTPSuccess)success failure:(HTTPFailure)failure;
/**
 *  post请求Json
 *
 *  @param baseURL    根路径
 *  @param path       子地址
 *  @param parameters 参数
 *  @param success    成功Block 回调
 *  @param failure    失败Block 回调
 */
- (void)postJsonWithBaseURL:(NSString *)baseURL path:(NSString *)path parameters:(NSDictionary *)parameters success:(HTTPSuccess)success failure:(HTTPFailure)failure;
@end
