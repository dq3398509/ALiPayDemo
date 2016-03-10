//
//  ViewController.m
//  ALiPayTest
//
//  Created by 董强 on 16/3/7.
//  Copyright © 2016年 董强. All rights reserved.
//

#import "ViewController.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

@interface ViewController ()

@property (nonatomic, copy) NSString *partner;
@property (nonatomic, copy) NSString *seller;
@property (nonatomic, copy) NSString *privateKey;

@property (nonatomic, strong) UIButton *payBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    
//    self.partner = @"2088702897879263";
//    self.seller = @"15640803610";
//    self.privateKey = @"MIICWwIBAAKBgQCmOxNYdkCmrKHVkMxtClOoM0gYF0FtQ85L+GQOgaWVE45y49hlImYTsBWuvGS+Iv7UW6SknKbB5nPj2FQKnUB3X0scc7j13xV7yFIvcX6l194oWkY0BGqF7fUk7q8iMcSLm6SDC9usX+usWH67K+dE+W/c/kFygDKl0c8YnTyRRwIDAQABAoGBAIwgLm2auWMHESDjf7/HPcADApn0OJ3v054s08N6vGcPZjwpHwgZ2CxuecijXNT+0QuX+REeUGARcM23VRjheC4Mi8ui5bqfcXE4C2LUQHtvzcmz+2YC/QsvUEzvgwxpJDzT+qsadlIZ0STkX93dLxcB8yIGcUKeoCwwukxINuB5AkEA023nbiTGJg4aMXzY20E7PoNPD793zTCYLBcSmD6kERQoeAwHr2EkCW7885011P1hs0THm0m/OTCL2F+s09ytQwJBAMlF9wWGtDgb09q3nMFPg2OcHW8JTzOL9RFka9Z12Y7wwveYK8hZbOP9zjnEqhhrx6RWfBu5gPaF3Nu3O4uZaa0CP35cMPSjBcm4o+7vrqtbUQ0LbTT8OZ1obYnsQDC9P1D1uzoD9pPaeq8opgTy8DlbNgjuEl28tYx4dxvaEnCMcwJABsi978i/kFiXxnqD5RwqAJSFhXWZ3tHr2783x03HnILO/4t4hlNFUVX/uoC/fv07CHYFzuVszGJstFczwZvVLQJANuuuZ8nT4fW225USpEzmotOAVfnmWAKw0YOT0a9FSbO8Y9LUNqfV4agVFwLZx5b/dhm+ljI3vveA2G1PeGIkCw==";
//    
    [self createButton];
}

- (void)createButton
{
    
    self.payBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.payBtn.frame = CGRectMake(50, 150, self.view.bounds.size.width - 100, 50);
    
    [self.payBtn setTitle:@"Pay" forState:UIControlStateNormal];
    [self.payBtn setBackgroundColor:[UIColor greenColor]];
    
    [self.payBtn addTarget:self action:@selector(payAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.payBtn];
    
}

- (void)payAction:(UIButton *)btn
{
    
    
    self.partner = @"2088702897879263";
    self.seller = @"15640803610";
    self.privateKey = @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAKY7E1h2QKasodWQzG0KU6gzSBgXQW1Dzkv4ZA6BpZUTjnLj2GUiZhOwFa68ZL4i/tRbpKScpsHmc+PYVAqdQHdfSxxzuPXfFXvIUi9xfqXX3ihaRjQEaoXt9STuryIxxIubpIML26xf66xYfrsr50T5b9z+QXKAMqXRzxidPJFHAgMBAAECgYEAjCAubZq5YwcRION/v8c9wAMCmfQ4ne/TnizTw3q8Zw9mPCkfCBnYLG55yKNc1P7RC5f5ER5QYBFwzbdVGOF4LgyLy6Llup9xcTgLYtRAe2/NybP7ZgL9Cy9QTO+DDGkkPNP6qxp2UhnRJORf3d0vFwHzIgZxQp6gLDC6TEg24HkCQQDTbeduJMYmDhoxfNjbQTs+g08Pv3fNMJgsFxKYPqQRFCh4DAevYSQJbvzznTXU/WGzRMebSb85MIvYX6zT3K1DAkEAyUX3BYa0OBvT2recwU+DY5wdbwlPM4v1EWRr1nXZjvDC95gryFls4/3OOcSqGGvHpFZ8G7mA9oXc27c7i5lprQI/flww9KMFybij7u+uq1tRDQttNPw5nWhtiexAML0/UPW7OgP2k9p6ryimBPLwOVs2CO4SXby1jHh3G9oScIxzAkAGyL3vyL+QWJfGeoPlHCoAlIWFdZne0evbvzfHTcecgs7/i3iGU0VRVf+6gL9+/TsIdgXO5WzMYmy0VzPBm9UtAkA2665nydPh9bbblRKkTOai04BV+eZYArDRg5PRr0VJs7xj0tQ2p9XhqBUXAtnHlv92Gb6WMje+94DYbU94YiQL";

    
    
    
    // partner 和 seller 获取失败提示
    if (self.partner.length == 0 || self.seller.length == 0 || self.privateKey.length == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"缺少 partner 或 seller 或私钥" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
        
        return;
    }
    
    /**
     *  生成订单信息及签名
     */

    // 将订单信息赋予ALiPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = self.partner;
    order.seller = self.seller;

    // 这里填写商品信息
    // 订单 ID , 由商家自行制定
    order.tradeNO = @"001";

    // 商品标题
    order.productName = @"情趣内衣";
    
    // 商品描述
    order.productDescription = @"这是一件情趣内衣";
    
    // 商品价格
    order.amount = @"88.5";
    
    // 回调URL,这个URL是在支付之后，支付宝通知后台服务器，使数据同步更新，必须填，不然支付无法成功
    order.notifyURL = @"www.baidu.com";
    
    
    /**
     *  固定参数, 不用改变
     */
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alpay.com";
    
    /**
     *  应用注册scheme, 在 ALiPayDemo - Info.plist 定义 URL types
     *
     *  appSheme 应用的加调地址, 支付完成后返回原应用使用
     */
    NSString *appSheme = @"ALiPayTest";
    
    // 将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@", orderSpec);
    
    // 获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(self.privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    // 将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    
    if (signedString != nil) {
        
        orderString = [NSString stringWithFormat:@"%@&sign = \"%@\"&sign_type = \"%@\"", orderSpec, signedString , @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appSheme callback:^(NSDictionary *resultDic) {
            
            NSLog(@"支付结果%@", resultDic);
            
        }];
        
    }
    
    
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
