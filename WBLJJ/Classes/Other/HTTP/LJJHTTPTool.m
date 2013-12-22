//
//  LJJHTTPTool.m
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJHTTPTool.h"

#import "AFNetworking.h"

@implementation LJJHTTPTool
shared_implement(LJJHTTPTool)
- (NSURLRequest *)requestWithBaseURL:(NSString *)baseURL method:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters {
    AFHTTPClient * client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:baseURL]];
    NSURLRequest * request = [client requestWithMethod:method path:path parameters:parameters];
    return request;
}

- (void)requestJsonWithBaseURL:(NSString *)baseURL method:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters success:(HTTPSuccess)success failure:(HTTPFailure)failure{
    NSURLRequest * request = [self requestWithBaseURL:baseURL method:method path:path parameters:parameters];
    AFJSONRequestOperation * op = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        if (success) {
            success(JSON);
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        if (failure) {
            failure(error,JSON);
        }
    }];
    [op start];
}

- (void)getJsonWithBaseURL:(NSString *)baseURL path:(NSString *)path parameters:(NSDictionary *)parameters success:(HTTPSuccess)success failure:(HTTPFailure)failure {
    [self requestJsonWithBaseURL:baseURL method:@"GET" path:path parameters:parameters success:success failure:failure];
}

- (void)postJsonWithBaseURL:(NSString *)baseURL path:(NSString *)path parameters:(NSDictionary *)parameters success:(HTTPSuccess)success failure:(HTTPFailure)failure {
    [self requestJsonWithBaseURL:baseURL method:@"POST" path:path parameters:parameters success:success failure:failure];
}
@end
