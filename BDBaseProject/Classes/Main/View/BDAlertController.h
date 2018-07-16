//
//  BDAlertController.h
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDAlertAction : UIAlertAction
/**按钮title字体颜色*/
@property (nonatomic, strong) UIColor * textColor;

@end

@interface BDAlertController : UIAlertController

/**统一按钮样式,不写系统默认的蓝色*/
@property (nonatomic,strong) UIColor *tintColor;
/**标题的颜色*/
@property (nonatomic,strong) UIColor *titleColor;
/**信息的颜色*/
@property (nonatomic,strong) UIColor *messageColor;

@end
