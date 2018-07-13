//
//  BDBaseCell.m
//  BDBaseProject
//
//  Created by BDiego on 2016/6/6.
//  Copyright © 2016年 Sword. All rights reserved.
//

#import "BDBaseCell.h"

@implementation BDBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self constructSubviews];
        [self didConstructedSubviews];
        [self resizeContentView];
    }
    return self;
}

- (void)constructSubviews{
    
}

- (void)didConstructedSubviews{
    
}

- (void)resizeContentView{
    
}

@end
