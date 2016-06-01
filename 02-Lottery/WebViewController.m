//
//  WebViewController.m
//  02-Lottery
//
//  Created by 王炯 on 16/5/31.
//  Copyright © 2016年 王炯. All rights reserved.
//

#import "WebViewController.h"
#import "HelpModel.h"


@interface WebViewController ()<UIWebViewDelegate>



@end

@implementation WebViewController


#warning 必须重写loadView方法将uiwebView列为主view，这样才能让webView显示HTML页面的所有信息(设置webView的约束也可以)
-(void)loadView
{
    self.view = [[UIWebView alloc] init];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加一个背景颜色，这样的话就不会有卡顿的现象
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(CloseWindow)];
    
    
    UIWebView *webView = (UIWebView *)self.view;
    
    webView.delegate = self;

    
#warning 根据本地html文件来创建url
    NSURL *url = [[NSBundle mainBundle] URLForResource:_model.html withExtension:nil];
    
#warning 根据url文件来创建request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
}

-(void)CloseWindow
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//代理方法:网页加载完毕之后调用
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
#warning 实现一段JS代码
    NSString *javaScriptCode = [NSString stringWithFormat:@"window.location.href = '#%@'",_model.ID];
    
    [webView stringByEvaluatingJavaScriptFromString:javaScriptCode];
    
}


@end
