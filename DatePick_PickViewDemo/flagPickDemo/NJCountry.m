//
//  NJCountry.m
//  03-PickerView(国旗选择)
//
//  Created by 李南江 on 14-5-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "NJCountry.h"

@implementation NJCountry

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)countryWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

@end
