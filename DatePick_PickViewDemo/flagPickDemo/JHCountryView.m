//
//  JHCountryView.m
//  国旗选择
//
//  Created by piglikeyoung on 15/3/9.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHCountryView.h"
#import "NJCountry.h"

@interface JHCountryView()

/**
    国家名称
 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/**
    
    国旗图片
 
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation JHCountryView

+(instancetype)countryView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"JHCountryView" owner:nil options:nil] firstObject];
}

+(CGFloat)rowHeight
{
    return 54;
}

-(void)setCountry:(NJCountry *)country
{
    _country = country;
    
    // 1.设置国家名称
    self.nameLabel.text = _country.name;
    // 2.设置国旗
    self.iconView.image = [UIImage imageNamed:_country.icon];
}

@end
