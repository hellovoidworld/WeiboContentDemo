//
//  ViewController.m
//  Weibo
//
//  Created by hellovoidworld on 14/12/4.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "ViewController.h"
#import "Weibo.h"
#import "WeiboCell.h"
#import "WeiboFrame.h"

@interface ViewController ()

/** 微博数组，类型是WeiboFrame，包含了数据和位置尺寸信息 */
@property(nonatomic, strong) NSArray *weibos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 屏蔽状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark -  数据源操作
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weibos.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 传入tableView是为了使用cell缓存池
    WeiboCell *cell = [WeiboCell cellWithTableView:self.tableView];
    
    // 传入微博的数据和位置尺寸信息
    cell.weiboFrame = self.weibos[indexPath.row];
    
    return cell;
}


#pragma mark - 加载数据
// 延迟加载plist文件中的数据为微博数组
- (NSArray *) weibos {
    if (nil == _weibos) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weibo.plist" ofType:nil]];
        
        NSMutableArray *mdictArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            WeiboFrame *weiboFrame = [[WeiboFrame alloc] init];
            Weibo *weibo = [Weibo weiboWithDictionary:dict];
            
            // 传入weibo模型数据到frame模型，内部保存数据，计算各个控件的位置、尺寸
            weiboFrame.weibo = weibo;
            
            [mdictArray addObject:weiboFrame];
        }
        
        _weibos = mdictArray;
    }
    
    return _weibos;
}


#pragma mark - 代理操作
// 动态调整每个cell的高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeiboFrame *weiboFrame = self.weibos[indexPath.row];
    return weiboFrame.cellHeight;
}

@end
