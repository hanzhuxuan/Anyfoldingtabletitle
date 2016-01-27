//
//  ViewController.m
//  AFN网络测试
//
//  Created by WXC on 15/9/1.
//  Copyright (c) 2015年 WXC. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "PreviewController.h"
#import "MBProgressHUD+MJ.h"
#import "TransformTools.h"
#import "MJExtension.h"
#import "CjPreview.h"
@interface ViewController ()
@property (nonatomic, weak) UIButton *clickBtn;
@property (nonatomic, strong) NSArray *groups;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 30)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"点击跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.clickBtn = btn;
    [self.clickBtn addTarget:self action:@selector(clickevent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clickevent
{
    [self getData1];
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
////    [self getDictionary];
////    [self getData];
//
//}

- (void)getDictionary
{
    NSString *url = @"http://m.yp.mo/macauzine/api/magazine.php";
    NSDictionary *parameter1 = @{@"pageID": @"1",@"catchnum": @"4"};
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    [mgr GET:url parameters:parameter1 success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"加载错误");
        
    }];
}


- (void)getData
{
    NSString *url = @"http://m.yp.mo/macauzine/api/article.php";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"mid"] = @"5";
    params[@"pageID"] = @"1";
    params[@"catchnum"] = @"10";
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSString *str1 = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"快讯的字符串数据。。。。：%@",str1);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",dic);
        
        // 判断是否返回数据异常
        if (dic[@"content"] == [NSNull null])
        {
            [MBProgressHUD showError:@"服务器异常"];
            return ;
        }
        
        
        TransformTools *tft = [TransformTools groupWithDict:dic];
        self.groups = tft.groupArr;

        PreviewController *preview = [[PreviewController alloc] init];
        preview.previews = self.groups;
        [self.navigationController pushViewController:preview animated:YES];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"加载错误 %@",error);
        
    }];
}

- (void)getData1
{
    
    NSString *url = @"http://m.yp.mo/macauzine/api/article.php";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"t"] = @"快訊";
    params[@"pageID"] = @"1";
    params[@"catchnum"] = @"10";
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"loadDataFromNetwork。。。。：数据加载成功");
        NSString *str1 = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"快讯的字符串数据。。。。：%@",str1);
        str1 = [str1 stringByReplacingOccurrencesOfString:@"\r\n"withString:@""];
        str1 = [str1 stringByReplacingOccurrencesOfString:@"\n"withString:@""];
        str1 = [str1 stringByReplacingOccurrencesOfString:@"\t"withString:@""];
//        NSLog(@"responseString = %@",str1);
        NSError *jsonError = nil;
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:[str1 dataUsingEncoding:NSUTF8StringEncoding] options:
                              NSJSONReadingMutableContainers error:&jsonError];
        NSLog(@"快讯的数据。。。。：%@",dic);
        
        
        NSArray *array = [CjPreview objectArrayWithKeyValuesArray:dic[@"content"]];
        for (CjPreview *HH in array) {
            NSLog(@"%@    %@    %@  %@",HH.atitle,HH.themeImg,HH.pubdate,HH.aID);
        }
       
        
        TransformTools *tft = [TransformTools groupWithDict:dic];
        self.groups = tft.groupArr;
        
        PreviewController *preview = [[PreviewController alloc] init];
        preview.previews = self.groups;
        [self.navigationController pushViewController:preview animated:YES];
//        NSLog(@"报错..... %@",jsonError);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"加载错误 %@",error);
        
    }];
}

@end
