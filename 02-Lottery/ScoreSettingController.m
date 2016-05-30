//
//  ScoreSettingController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/29.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "ScoreSettingController.h"

@interface ScoreSettingController ()

#warning 懒加载textField,toobar和datePicker，使用strong修饰
@property (nonatomic,strong)UITextField *textField;

@property (nonatomic,strong)UIDatePicker *datePicker;

@property (nonatomic,strong)UIToolbar *toolBar;


@property (nonatomic,weak)UITableViewCell *cell;


@end

@implementation ScoreSettingController

//懒加载3个控件，只有在用的时候才加载，且只加载一次
-(UITextField *)textField
{
    if (_textField == nil)
    {
        _textField = [UITextField new];
        
#warning 设置textField的inputView为上面的datePicker(键盘)
        _textField.inputView = self.datePicker;
#warning 设置textField的inputAccessoryView为上面的toolBar
        _textField.inputAccessoryView = self.toolBar;
    }
    return _textField;
}

-(UIDatePicker *)datePicker
{
    if (_datePicker == nil)
    {
        _datePicker = [UIDatePicker new];
        
        //1.1设置datePicker的区域
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        
        //1.2设置datePicker的model(只显示时间)
        _datePicker.datePickerMode = UIDatePickerModeTime;
    }
    
    return _datePicker;
}

-(UIToolbar *)toolBar
{
    if (_toolBar == nil)
    {
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
        
        //2.1给toolBar添加bar Button Item
        
#warning 添加一个取消按钮
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(Cancel)];
        
#warning 添加一个弹簧
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
#warning 添加确定按钮
        UIBarButtonItem *sureButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(Sure)];
        
        //添加到toolBar上
        _toolBar.items = @[cancelButton,flex,sureButton];
    }
    
    return _toolBar;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#warning 在此类中重写-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath方法，达到点击后两组cell时能设置时间

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return;
    }
    
    [self.view addSubview:self.textField];
    
#warning 设置textField为第一响应者，但是不让它显示出来
    [self.textField becomeFirstResponder];
    
    if (indexPath.section == 2)
    {
        self.view.transform = CGAffineTransformMakeTranslation(0, -44);
    }
    
    //获取此时被点击的cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    self.cell = cell;
    
    
}

-(void)Cancel
{
    [self.view endEditing:YES];
    
    self.view.transform = CGAffineTransformIdentity;
}

-(void)Sure
{
    //把时间赋值给cell的detailText
    //(1)取出时间
    NSDate *date = self.datePicker.date;
    
    //(2)实例化时间格式
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"HH:mm"];
    
    NSString *getTime = [dateFormat stringFromDate:date];
    
    self.cell.detailTextLabel.text = getTime;
    
    
    //恢复
    [self.view endEditing:YES];
    
    self.view.transform = CGAffineTransformIdentity;
}


@end
