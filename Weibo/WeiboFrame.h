//
//  WeiboFrame.h
//  Weibo
//
//  Created by hellovoidworld on 14/12/5.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

// 装在了每个cell的位置、尺寸和微博数据的model

@class Weibo;
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> // CGRect需要引入UIKit

@interface WeiboFrame : NSObject

// 微博数据
@property(nonatomic, strong) Weibo *weibo;

/** 头像 */
@property(nonatomic, assign, readonly) CGRect iconFrame;

/** 昵称 */
@property(nonatomic, assign, readonly) CGRect nameFrame;

/** vip标志 */
@property(nonatomic, assign, readonly) CGRect vipFrame;

/** 博文 */
@property(nonatomic, assign, readonly) CGRect textFrame;

/** 配图 */
@property(nonatomic, assign, readonly) CGRect pictureFrame;

/** 一条微博cell的高度 */
@property(nonatomic, assign, readonly) CGFloat cellHeight;


@end
