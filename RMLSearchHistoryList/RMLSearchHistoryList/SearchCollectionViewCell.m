//
//  SearchCollectionViewCell.m
//  RMLSearchHistoryList
//
//  Created by blue on 2017/10/22.
//  Copyright © 2017年 blue. All rights reserved.
//

#import "SearchCollectionViewCell.h"


CGFloat heightForCell = 30;
@implementation SearchCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, heightForCell)];
    self.titleLabel = titleLabel;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.layer.cornerRadius = 4;
    self.titleLabel.layer.masksToBounds = YES;
}


#pragma mark — 实现自适应文字宽度的关键步骤:item的layoutAttributes
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.titleLabel.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.titleLabel.font,NSFontAttributeName, nil] context:nil];
    
    frame.size.height = heightForCell;
    frame.size.width += 2 * 12;
    attributes.frame = CGRectIntegral(frame);
    
    self.titleLabel.frame = CGRectMake(0, 0, attributes.frame.size.width, heightForCell);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    return attributes;
}

@end
