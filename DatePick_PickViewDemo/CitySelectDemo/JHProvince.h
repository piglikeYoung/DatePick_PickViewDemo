//
//  JHProvince.h
//  城市选择
//
//  Created by piglikeyoung on 15/3/9.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHProvince : NSObject

/**
 *  省份名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  该省身份城市
 */
@property (nonatomic, strong) NSArray *cities;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)provinceWithDictionary:(NSDictionary *)dict;

@end
