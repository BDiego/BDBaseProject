//
//  UIScrollView+refresh.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>


@interface UIScrollView (refresh)

-(void)scrollViewCreatRefreshWtihTarget:(id)target HeadSelector:(SEL)headSelector footerSelector:(SEL)footerSelector;

@end
