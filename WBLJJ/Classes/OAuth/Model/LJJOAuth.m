//
//  LJJOAuth.m
//  WBLJJ
//
//  Created by Jun on 13-12-22.
//  Copyright (c) 2013年 Jun. All rights reserved.
//

#import "LJJOAuth.h"

@implementation LJJOAuth
- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _token = [aDecoder decodeObjectForKey:@"token"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_token forKey:@"token"];
    [aCoder encodeObject:_uid forKey:@"uid"];
}
@end
