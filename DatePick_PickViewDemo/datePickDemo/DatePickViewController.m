//
//  DatePickViewController.m
//  DatePick_PickViewDemo
//
//  Created by piglikeyoung on 15/8/7.
//  Copyright (c) 2015年 piglikeyoung. All rights reserved.
//

#import "DatePickViewController.h"

@interface DatePickViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation DatePickViewController

- (NSDateFormatter *)formatter {
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        [_formatter setDateFormat:@"YYYY年MM月dd日 HH:mm:ss"];
    }
    return _formatter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test1];
    
    [self test2];
}


/**
 *  添加辅助视图的方式
 */
- (void)test2{
    // 1.创建时间选择器
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    // 设置只显示日期
    datePicker.datePickerMode = UIDatePickerModeDate;
    // 设置日期为中文
    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    //datePicker.frame = CGRectMake(0, 44, 320, 162);
    
    [datePicker addTarget:self action:@selector(choseDate:) forControlEvents:UIControlEventValueChanged];
    
    
    self.textField.inputView = datePicker;
    
    // 2.创建工具条
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, 0, 320, 44);
    
    // 2.1给工具条添加按钮
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc]initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:self action:@selector(previousBtnClick)];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(nextBtnClick)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(DoneBtnClick)];
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    toolbar.items = @[item0,item1,item3,item2];
    
    // 设置文本输入框键盘的辅助视图
    self.textField.inputAccessoryView = toolbar;
}


/**
 *  淳朴添加工具条的方式
 */
- (void)test1{
    
    // 这是纯朴的做法！！！
    
     // 1.创建最外面的view
     UIView *view = [[UIView alloc] init];
     view.frame = CGRectMake(0, 480 - 162 - 44, 320, 162 + 44);
     
     // 2.创建工具条
     UIToolbar *toolbar = [[UIToolbar alloc] init];
     toolbar.frame = CGRectMake(0, 0, 320, 44);
     
     // 2.1给工具条添加按钮
     UIBarButtonItem *item0 = [[UIBarButtonItem alloc]initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:self action:@selector(previousBtnClick)];
     
     UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(nextBtnClick)];
     
     UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(DoneBtnClick)];
     
     UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
     
     toolbar.items = @[item0,item1,item3,item2];
     
     [view addSubview:toolbar];
     
     // 3.创建时间选择器
     UIDatePicker *datePicker = [[UIDatePicker alloc] init];
     // 设置只显示日期
     datePicker.datePickerMode = UIDatePickerModeDate;
     // 设置日期为中文
     datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
     datePicker.frame = CGRectMake(0, 44, 320, 162);
     
     [datePicker addTarget:self action:@selector(choseDate:) forControlEvents:UIControlEventValueChanged];
     
     [view addSubview:datePicker];
     
     self.textField.inputView = view;
     
}

- (void)previousBtnClick
{
    NSLog(@"上一个");
}

- (void)nextBtnClick
{
    NSLog(@"下一个");
}

- (void)DoneBtnClick
{
    if (self.textField.text.length <= 0) {
        NSDate *nowDate = [NSDate date];
        self.textField.text = [self.formatter stringFromDate:nowDate];
    }
    
    [self.textField endEditing:YES];
   
}

-(void)choseDate:(UIDatePicker *)datePicker
{
    NSDate *selectedDate = [datePicker date];
    self.textField.text = [self.formatter stringFromDate:selectedDate];
}


@end
