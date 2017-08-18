//
//  ViewController.m
//  JiaoHuHTML
//
//  Created by 余晔 on 2017/7/24.
//  Copyright © 2017年 余晔. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView *_webView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    [self.view addSubview:_webView];

    
    //2.加载本地的HTML代码
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString *s = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",s);
    
    [_webView loadHTMLString:s baseURL:nil];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    

}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    JSContext *context = [_webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *textJS = @"showAlert('这里是JS中alert弹出的message')";
    [context evaluateScript:textJS];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
