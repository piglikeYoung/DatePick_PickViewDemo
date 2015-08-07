//
//  JHCountryView.h
//  国旗选择
//
//  Created by piglikeyoung on 15/3/9.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NJCountry;

@interface JHCountryView : UIView

/** 数据模型 */
@property (strong , nonatomic) NJCountry *country;

+(instancetype)countryView;

+(CGFloat)rowHeight;

@end
