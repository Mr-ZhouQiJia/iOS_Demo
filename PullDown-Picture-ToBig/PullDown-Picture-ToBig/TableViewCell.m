//
//  TableViewCell.m
//  PullDown-Picture-ToBig
//
//  Created by ddsc on 2018/5/11.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import "TableViewCell.h"
#import <Masonry.h>
@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.label = [[UILabel alloc]init];
        self.label.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.label];
        self.image = [[UIImageView alloc]init];
        self.image.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.image];
        
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(5);
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.mas_equalTo(20);
    }];
    
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.mas_bottom).offset(5);
        make.width.equalTo(self.label);
        make.left.equalTo(self.contentView).offset(15);
        make.height.mas_equalTo(100);
        
    }];
    
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
