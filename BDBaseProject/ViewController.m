//
//  ViewController.m
//  BDBaseProject
//
//  Created by WangYibao on 2018/7/12.
//  Copyright © 2018年 Sword. All rights reserved.
//

#import "ViewController.h"
#import "BDAlertControllerManager.h"
#import <UIImage+GIF.h>
#import <SDWebImageDownloader.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%f",kStatusBarHeight);
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];

    
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:@"https://share.quanmin.top/update/apppop/zhuanpan.gif"] options:nil progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        UIImage * imageaa = [UIImage sd_animatedGIFWithData:data];
        [button setImage:imageaa forState:UIControlStateNormal];
    }];
    
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [[BDAlertControllerManager shareInstance] alertWithTitle:@"111" message:@"2222" block:^(NSInteger buttonIndex) {
//        
//    } cancelButtonTitle:@"333" otherButtonTitles: nil];
//
//    [[BDAlertControllerManager shareInstance] actionSheetWithTitle:@"你好" message:@"啊啊啊啊" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles: nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
