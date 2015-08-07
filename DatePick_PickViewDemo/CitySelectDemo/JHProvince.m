//
//  JHProvince.m
//  城市选择
//
//  Created by piglikeyoung on 15/3/9.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHProvince.h"

@implementation JHProvince

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [self init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)provinceWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

@end
