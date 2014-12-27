//
//  Weibo.m
//  Weibo
//
//  Created by hellovoidworld on 14/12/5.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "Weibo.h"

@implementation Weibo

/** 使用字典赋值成员 */
- (instancetype) initWithDictionary:(NSDictionary *) dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

/** 使用字典赋值成员 */
+ (instancetype) weiboWithDictionary:(NSDictionary *) dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

/** 返回空的model */
+ (instancetype) weibo {
    return [self weiboWithDictionary:nil];
}

@end
