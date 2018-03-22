//
//  ViewController.m
//  runtime
//
//  Created by corepress on 2018/3/22.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"
#import "NSObject+NSObject.h"
#import "NSDictionary+Perperty.h"
#import "Infos.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //    Person *p = [Person alloc];
    Person *p = objc_msgSend(objc_getClass("Person"),sel_registerName("alloc"));
    //   Person *p = objc_msgSend([Person class], @selector(alloc));
    //    p = [p init];
    p = objc_msgSend(p, sel_registerName("init"));
    //   p = objc_msgSend(p, @selector(init));
    objc_msgSend(p, sel_registerName("run:"),2330.99);   //可以调用私有方法
    //    objc_msgSend(p, @selector(run:),349839.00);
    
    //     [UIImage imageNamed:@"to_left.png"];
    
    //    [p performSelector:@selector(sleep)];
    
    [p performSelector:@selector(drink:) withObject:@200];  //利用runtime动态添加实例方法
    
    //    [Person performSelector:@selector(watch)];
    
    NSObject *object = [[NSObject alloc] init];
    object.name = @"nfsf2323";
    NSLog(@"%@",object.name);
    
    object.age = 21.0;
    NSLog(@"%d",object.age);
    
    
    NSString *filePatch = [[NSBundle mainBundle]pathForResource:@"Info.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePatch];
    
    NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
    //    [mutableDict removeObjectForKey:@"UISupportedInterfaceOrientations~ipad"];
    
    [dict creatPropertyCode:mutableDict];
    
    //    Infos *info = [Infos itemWithDict:mutableDict];
    
    Infos *info = [Infos modelWithDic:dict];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
