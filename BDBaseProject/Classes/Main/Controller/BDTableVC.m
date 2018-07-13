//
//  BDTableVC.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDTableVC.h"
#import "UIScrollView+refresh.h"

@interface BDTableVC ()

@end

@implementation BDTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)constructContentView{
    [self creatTableView];
}

-(void)creatTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = [UIView new];
#ifdef __IPHONE_11_0
    if ([self.tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
#endif
}

-(void)registerCellWithClassString:(NSString *)cellString isNib:(BOOL)isNib{
    if (isNib) {
        [self.tableView registerNib:[UINib nibWithNibName:cellString bundle:nil] forCellReuseIdentifier:cellString];
    } else {
        [self.tableView registerClass:NSClassFromString(cellString) forCellReuseIdentifier:cellString];
    }
}
-(void)registerCellWithCellClassArr:(NSArray<NSString *> *)cellArr isNib:(BOOL)isNib{
    if (isNib) {
        for (NSString *cellString in cellArr) {
            [self.tableView registerNib:[UINib nibWithNibName:cellString bundle:nil] forCellReuseIdentifier:cellString];
        }
    } else {
        for (NSString *cellString in cellArr) {
            [self.tableView registerClass:NSClassFromString(cellString) forCellReuseIdentifier:cellString];
        }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

-(void)creatRefreshWtihHeadSelector:(SEL)headSelector footerSelector:(SEL)footerSelector{
    [self.tableView scrollViewCreatRefreshWtihTarget:self HeadSelector:headSelector footerSelector:footerSelector];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
