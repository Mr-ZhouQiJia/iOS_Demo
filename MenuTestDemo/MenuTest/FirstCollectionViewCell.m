//
//  FirstCollectionViewCell.m
//  MenuTest
//
//  Created by ddsc on 2018/5/21.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import "FirstCollectionViewCell.h"

@implementation FirstCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.title = [[UILabel alloc]init];
        self.title.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.title];
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
}

@end
