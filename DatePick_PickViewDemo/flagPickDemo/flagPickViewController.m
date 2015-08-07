//
//  flagPickViewController.m
//  DatePick_PickViewDemo
//
//  Created by piglikeyoung on 15/8/7.
//  Copyright (c) 2015年 piglikeyoung. All rights reserved.
//

#import "FlagPickViewController.h"
#import "NJCountry.h"
#import "JHCountryView.h"

@interface FlagPickViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

// 保存所有国家信息
@property (strong , nonatomic) NSArray *countrys;

@end

@implementation FlagPickViewController

#pragma mark - 懒加载
- (NSArray *)countrys
{
    if (_countrys == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            NJCountry *country = [NJCountry countryWithDictionary:dict];
            [models addObject:country];
        }
        self.countrys = [models copy];
    }
    return _countrys;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.countrys.count;
}

#pragma mark - UIPickerViewDelegate
// 返回第component列的第row行需要显示的视图
// 当一个view进入视野范围内的时候调用
// 当系统调用该方法的时候会自动传入可重用的view
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    // 1.创建自定义view
    JHCountryView *countryView = (JHCountryView *)view;
    
    if (countryView == nil) {
        countryView = [JHCountryView countryView];
    }
    
    // 2.赋值模型数据
    countryView.country = self.countrys[row];
    
    // 3.返回自定义view
    return countryView;
}


-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return [JHCountryView rowHeight];
}

@end
