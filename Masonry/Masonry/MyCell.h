//
//  MyCell.h
//  Masonry
//
//  Created by ddsc on 2018/5/4.
//  Copyright © 2018年 ddsc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface MyCell : UITableViewCell
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *content;
@property (nonatomic,strong)UIImageView *image1;
@property (nonatomic,strong)UIImageView *image2;
@property (nonatomic,strong)UIImageView *image3;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,strong)Model *model;
@end
