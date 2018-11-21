//
//  MyCell.m
//  Masonry
//
//  Created by ddsc on 2018/5/4.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import "MyCell.h"
#import <Masonry.h>
@implementation MyCell

- (void)setModel:(Model *)model{
    self.title.text = model.title;
    self.content.text = model.content;
    [self getCellHeight];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.title = [[UILabel alloc]init];
        self.title.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.title];
        self.content = [[UILabel alloc]init];
        self.content.numberOfLines = 0;
        self.content.font = [UIFont systemFontOfSize:17];
        self.content.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.content];
        self.image1 = [[UIImageView alloc]init];
        self.image1.image = [UIImage imageNamed:@"WechatIMG1.jpeg"];
        [self.contentView addSubview:self.image1];
        self.image2 = [[UIImageView alloc]init];
        self.image2.image = [UIImage imageNamed:@"WechatIMG1.jpeg"];
        [self.contentView addSubview:self.image2];
        self.image3 = [[UIImageView alloc]init];
        self.image3.image = [UIImage imageNamed:@"WechatIMG1.jpeg"];
        [self.contentView addSubview:self.image3];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(15);
        make.right.mas_equalTo(self.contentView).offset(-15);
        make.top.mas_equalTo(self.contentView).offset(5);
        make.height.mas_equalTo(20);
    }];
    
    NSArray *list = @[self.image1,self.image2,self.image3];
    [list mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:15 tailSpacing:15];
    [list mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom).offset(5);
      //  make.left.equalTo(self.contentView).offset(15);
      //  make.right.equalTo(self.contentView).offset(-15);
        make.height.mas_equalTo(100);
    }];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.image1.mas_bottom).offset(5);
        make.left.mas_equalTo(self.contentView).offset(15);
        make.right.mas_equalTo(self.contentView).offset(-15);
        make.bottom.mas_equalTo(self.contentView).offset(-5);
    }];
    
    
}

- (void)getCellHeight{
    CGFloat hei = [self.model.content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, 1000) options:NSStringDrawingUsesFontLeading |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17]} context:nil].size.height;
    self.height = 5 + 20 + 5 + 100 + hei ;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
