//
//  NJCountry.h
//  03-PickerView(国旗选择)
//
//  Created by 李南江 on 14-5-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJCountry : NSObject
/**
 *  国家名称
 */
@property (nonatomic, strong)NSString *name;
/**
 *  国旗图片
 */
@property (nonatomic, strong)NSString *icon;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)countryWithDictionary:(NSDictionary *)dict;
@end
