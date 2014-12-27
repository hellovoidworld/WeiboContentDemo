//
//  WeiboCell.m
//  Weibo
//
//  Created by hellovoidworld on 14/12/5.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "WeiboCell.h"
#import "WeiboFrame.h"
#import "Weibo.h"

// 昵称字体
#define NAME_FONT [UIFont systemFontOfSize:14]
// 博文字体
#define TEXT_FONT [UIFont systemFontOfSize:15]


@interface WeiboCell()

// 创建各个子控件的成员，用来分离数据赋值和尺寸、位置调整
/** 头像 */
@property(nonatomic, weak) UIImageView *iconView;

/** 昵称 */
@property(nonatomic, weak) UILabel *nameView;

/** vip标志 */
@property(nonatomic, weak) UIImageView *vipView;

/** 博文 */
@property(nonatomic, weak) UILabel *textView;

/** 配图 */
@property(nonatomic, weak) UIImageView *pictureView;

@end

@implementation WeiboCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 初始化
// 自定义带有父控件tableView初始化方法
+ (instancetype) cellWithTableView:(UITableView *) tableView {
    static NSString *ID = @"weibo";
    
    // 从缓存池寻找
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 使用重写的构造方法初始化
    if (nil == cell) {
        cell = [[WeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return  cell;
}

// 重写缓存池初始化方法，加入各个子控件，可以设置静态数据，但是没有动态的数据和位置尺寸信息
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 1.头像
        /** 
            由于self.iconView是weak类型,不能写成:
            self.iconView = [[UIImageView alloc] init];
            会被立即释放，不能正常赋值，下同
         */
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        // 2.昵称
        UILabel *nameView = [[UILabel alloc] init];
        // 指定字体用来计算占用的尺寸大小
        nameView.font = NAME_FONT;
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        // 3.vip标志
        UIImageView *vipView = [[UIImageView alloc] init];
        vipView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        
        // 4.博文
        UILabel *textView = [[UILabel alloc] init];
        textView.font = TEXT_FONT;
        textView.numberOfLines = 0;// 设置自动换行
        [self.contentView addSubview:textView];
        self.textView = textView;
        
        // 5.配图
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
    }
    
    return self;
}

#pragma mark - 数据加载
// 加载数据的时候设置数据和尺寸、位置
- (void)setWeiboFrame:(WeiboFrame *)weiboFrame {
    _weiboFrame = weiboFrame;
    
    // 1.设置数据
    [self calWeiboData];
    
    // 2.设置尺寸、位置
    [self calWeiboFrame];
}

// 设置数据
- (void) calWeiboData {
    Weibo *weibo = self.weiboFrame.weibo;
    
    // 1.头像
    self.iconView.image = [UIImage imageNamed:weibo.icon];
    
    // 2.昵称
    self.nameView.text = weibo.name;
    
    // 3.vip标志
    if (weibo.vip) {
        self.vipView.hidden = NO;
    }
    else {
        self.vipView.hidden = YES;
    }
    
    // 4.博文
    self.textView.text = weibo.text;

    
    // 5.配图
    if (weibo.picture) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:weibo.picture];
    }
    else {
        self.pictureView.hidden = YES;
        self.pictureView.image = nil;
    }
}

// 设置位置、尺寸
- (void) calWeiboFrame {
    // 1.头像
    self.iconView.frame = self.weiboFrame.iconFrame;
    
    // 2.昵称
    self.nameView.frame = self.weiboFrame.nameFrame;
    
    // 3.vip标志
    self.vipView.frame = self.weiboFrame.vipFrame;
    
    // 4.博文
    self.textView.frame = self.weiboFrame.textFrame;
    
    // 5.配图
    if (self.weiboFrame.weibo.picture) {
        self.pictureView.frame = self.weiboFrame.pictureFrame;
    }
}


@end
