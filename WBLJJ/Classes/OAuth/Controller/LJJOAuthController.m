//
//  LJJOAuthController.m
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJOAuthController.h"
#import "MBProgressHUD.h"
//#import "AFNetworking.h"
#import "LJJHTTPTool.h"
#import "LJJOAuthTool.h"
#import "LJJMainController.h"

#define kAppKey @"4110351238"
#define kAppSecret @"96af517c6edee043c489b4c0af7b48f3"
#define kRedirectURI @"https://api.weibo.com/oauth2/default.html"

#define kTokenPath @"/oauth2/access_token"

#define kBaseURL @"https://api.weibo.com"

@interface LJJOAuthController () <UIWebViewDelegate>
{
    UIWebView   * _webView;
    BOOL        _isSuccess;
}
@end

@implementation LJJOAuthController

- (void)loadView {
    self.view = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _webView = (UIWebView *)self.view;
    [_webView setDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSURL * url = [NSURL URLWithString:@"https://api.weibo.com"];
//    AFHTTPClient * client = [AFHTTPClient clientWithBaseURL:url];
    
//    NSURLRequest * request = [client requestWithMethod:@"GET" path:@"/oauth2/authorize" parameters:@{
//         @"client_id"   : kAppKey,
//         @"redirect_uri": kRedirectURI,
//         @"display"     : @"mobile"
//     }];
    
    NSURLRequest * request = [[LJJHTTPTool sharedLJJHTTPTool]requestWithBaseURL:kBaseURL method:@"GET" path:@"/oauth2/authorize" parameters:@{
         @"client_id"   : kAppKey,
         @"redirect_uri": kRedirectURI,
         @"display"     : @"mobile"
         }];
    
    [_webView loadRequest:request];
}

#pragma mark - webView代理

#pragma mark 链接中
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"%@",request);
    NSString * path = [request URL].absoluteString;
    
    NSRange codeRange = [path rangeOfString:@"code="];
    if (codeRange.length > 0) {
        NSString * code = [path substringFromIndex:codeRange.location + codeRange.length];
//        NSLog(@"%@",code);
        [[LJJHTTPTool sharedLJJHTTPTool] postJsonWithBaseURL:kBaseURL path:kTokenPath parameters:@{
           @"client_id" : kAppKey,
           @"client_secret": kAppSecret,
           @"grant_type": @"authorization_code",
           @"code":code,
           @"redirect_uri":kRedirectURI
          } success:^(id json) {
              NSString * accessToken = json[@"access_token"];
              NSString * uid = json[@"uid"];
              [[LJJOAuthTool sharedLJJOAuthTool] saveOAuthWithToken:accessToken uid:uid];
              //跳转到主页面
              self.view.window.rootViewController = [[LJJMainController alloc]init];
          } failure:^(NSError *error, id json) {
              NSLog(@"failure -- %@",error);
              
          }];
        _isSuccess = YES;
        [_webView stopLoading];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        return NO;
    }
    return YES;
}

#pragma mark 链接开始
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
#pragma mark 链接成功
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
#pragma mark 链接失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    if (_isSuccess) return;
    
    NSString * msg = [NSString stringWithFormat:@"网络异常，请检查您的网络 -- %@",error.localizedDescription];
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"加载界面失败" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}


@end
