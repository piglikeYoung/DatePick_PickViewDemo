//
//  CitySelectViewController.m
//  DatePick_PickViewDemo
//
//  Created by piglikeyoung on 15/8/7.
//  Copyright (c) 2015年 piglikeyoung. All rights reserved.
//

#import "CitySelectViewController.h"
#import "JHProvince.h"

@interface CitySelectViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong , nonatomic) NSArray *provinces;

@property (weak , nonatomic) UIPickerView *pickerView;
@end

@implementation CitySelectViewController

#pragma mark - 懒加载
- (NSArray *)provinces
{
    if (_provinces == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            JHProvince *province = [JHProvince provinceWithDictionary:dict];
            [models addObject:province];
        }
        self.provinces = [models copy];
    }
    return _provinces;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建pickerView
    // pickerView有默认的frame
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [self.view addSubview:pickerView];
    self.pickerView = pickerView;
}

#pragma mark - UIPickerViewDataSource
// 告诉系统有多少列
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// 告诉系统有多少行
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (0 == component) {
        // 省份列
        return self.provinces.count;
    } else {
        // 城市列
        // 获取第0列选中的行
        NSInteger selectIndex = [self.pickerView selectedRowInComponent:0];
        // 1.根据第0列选中的行数获取对应的省
        JHProvince *province = self.provinces[selectIndex];
        // 2.获取对应省份对应的城市
        NSArray *cities = province.cities;
        // 2.返回城市的个数
        return cities.count;
    }
}

#pragma mark - UIPickerViewDelegate
// 告诉系统每一行显示什么内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (0 == component) {
        // 省份
        // 1.获取对应行的省份
        JHProvince *province = self.provinces[row];
        // 2.返回省份的名称
        return province.name;
    }else{
        // 城市
        // 1.获取第0列选中的行数
        NSInteger selectIndex = [pickerView selectedRowInComponent:0];
        // 2.获取对应的省份
        JHProvince *province = self.provinces[selectIndex];
        // 3.获取对应的城市
        return province.cities[row];
    }
}

// 监听pickerView的选中
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (0 == component) {
        // 刷新第1列对应的数据
        [pickerView reloadComponent:1];
        // 让第1列滚动到第0行
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

@end
