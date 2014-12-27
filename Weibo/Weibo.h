//
//  Weibo.h
//  Weibo
//
//  Created by hellovoidworld on 14/12/5.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

// 装在微博数据的model
#import <Foundation/Foundation.h>

@interface Weibo : NSObject

#pragma mark - 成员变量
/** 头像 */
@property(nonatomic, copy) NSString *icon;

/** 昵称 */
@property(nonatomic, copy) NSString *name;

/** vip标志 */
@property(nonatomic, assign) BOOL vip;

/** 博文 */
@property(nonatomic, copy) NSString *text;

/** 配图 */
@property(nonatomic, copy) NSString *picture;


#pragma mark - 自定义初始化方法
/** 使用字典赋值成员 */
- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

/** 使用字典赋值成员 */
+ (instancetype) weiboWithDictionary:(NSDictionary *) dictionary;

/** 返回空的model */
+ (instancetype) weibo;

@end
