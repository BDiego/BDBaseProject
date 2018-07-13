//
//  UIScrollView+refresh.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "UIScrollView+refresh.h"

@implementation UIScrollView (refresh)

-(void)scrollViewCreatRefreshWtihTarget:(id)target HeadSelector:(SEL)headSelector footerSelector:(SEL)footerSelector{
    
    if (!target) {
        return;
    }
    if([target respondsToSelector:headSelector]){
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:headSelector];
//        header.lastUpdatedTimeLabel.hidden = YES;
//        header.stateLabel.hidden = YES;
        self.mj_header = header;
    }
    if ([target respondsToSelector:footerSelector]) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:footerSelector];
//        footer.refreshingTitleHidden = YES;
//        footer.stateLabel.hidden = YES;
        self.mj_footer = footer;
    }

}
@end
