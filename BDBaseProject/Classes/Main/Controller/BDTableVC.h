//
//  BDTableVC.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDBaseVC.h"

@interface BDTableVC : BDBaseVC<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

-(void)creatTableView;
//注册单个cell
-(void)registerCellWithClassString:(NSString *)cellString isNib:(BOOL)isNib;
//注册多个cell
-(void)registerCellWithCellClassArr:(NSArray<NSString *> *)cellArr isNib:(BOOL)isNib;
//创建刷新
-(void)creatRefreshWtihHeadSelector:(SEL)headSelector footerSelector:(SEL)footerSelector;

@end
