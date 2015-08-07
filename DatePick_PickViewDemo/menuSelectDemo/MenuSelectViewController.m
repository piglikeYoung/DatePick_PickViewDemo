//
//  MenuSelectViewController.m
//  DatePick_PickViewDemo
//
//  Created by piglikeyoung on 15/8/7.
//  Copyright (c) 2015年 piglikeyoung. All rights reserved.
//

#import "MenuSelectViewController.h"

@interface MenuSelectViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

/** 所有食物 */
@property (strong , nonatomic) NSArray *foods;

/**
 *  水果
 */
@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
/**
 *  蔬菜
 */
@property (weak, nonatomic) IBOutlet UILabel *stapleLabel;
/**
 *  饮料
 */
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;

/**
 *  随机按钮点击事件
 */
- (IBAction)randomFood:(UIButton *)sender;

@end

@implementation MenuSelectViewController

#pragma mark - 懒加载
- (NSArray *)foods
{
    if (_foods == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
        _foods = [NSArray arrayWithContentsOfFile:fullPath];
    }
    return _foods;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int component = 0; component < self.foods.count; component++) {
        [self pickerView:nil didSelectRow:0 inComponent:component];
    }
}


#pragma mark - UIPickerViewDataSource
// 返回pickerView一共有多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foods.count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // 1.获取对应列的数组
    NSArray *subFoods = self.foods[component];
    // 2.返回对应列的行数
    return subFoods.count;
}

#pragma mark - UIPickerViewDelegate
// 返回第component列的第row行显示什么内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 1.获取对应列的数组
    NSArray *subFoods = self.foods[component];
    // 2.获取对应行的标题
    NSString *name = subFoods[row];
    return name;
}

// 当选中了pickerView的某一行的时候调用
// 会将选中的列号和行号作为参数传入
// 只有通过手指选中某一行的时候才会调用
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 1.获取对应列对应行的数据
    NSString *name = self.foods[component][row];
    
    // 2.判断选择的是哪一列，根据列号设置对应的数据
    if (0 == component) {
        // 水果
        self.fruitLabel.text = name;
    }else if (1 == component)
    {
        // 主菜
        self.stapleLabel.text = name;
    }else{
        // 饮料
        self.drinkLabel.text = name;
    }
}

#pragma mark - 监听按钮点击
-(IBAction)randomFood:(UIButton *)sender
{
    for (int component = 0; component<self.foods.count;component++) {
        // 获取对应列的数据总数
        int total = [self.foods[component]count];
        // 根据每一列的总数生成随机数（当前生成的随机数）
        int randomNumber = arc4random() % total;
        
        // 获取当前选中的行（上次随机后移动到的行）
        int oldRow = [self.pickerView selectedRowInComponent:component];
        
        // 比较上一次的行号和当前生成的随机数是否相同，如果相同重新生成
        while (oldRow == randomNumber) {
            randomNumber = arc4random() % total;
        }
        
        // 让pickerView滚动到某一行
        [self.pickerView selectRow:randomNumber inComponent:component animated:YES];
        
        // 通过代码选中某一行
        [self pickerView:nil didSelectRow:randomNumber inComponent:component];
    }
}

@end
