//
//  WeiboCell.h
//  Weibo
//
//  Created by hellovoidworld on 14/12/5.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

// 用于装载每个TabelViewCell的model
#import <UIKit/UIKit.h>

@class WeiboFrame;
@interface WeiboCell : UITableViewCell

// 微博frame，内持有微博数据和尺寸、位置信息
@property(nonatomic, strong) WeiboFrame *weiboFrame;


// 自定义带有父控件tableView初始化方法
+ (instancetype) cellWithTableView:(UITableView *) tableView;

@end
