//
//  Infos.m
//  runtime
//
//  Created by corepress on 2018/3/8.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "Infos.h"
#import <objc/message.h>

@implementation Infos

+ (instancetype)itemWithDict:(NSDictionary *)dict { //KVC是遍历字典中的key值，去模型类里面去查找有没有所对应的key
    
        Infos *info = [[self alloc] init];
        
        [info setValuesForKeysWithDictionary:dict];

         return info;
}


+(instancetype)modelWithDic:(NSDictionary*)dict { //runtime遍历属性在字典里面去查找有没有对应的key
    
   Infos *info = [[self alloc] init];
    
    unsigned int count = 0;
    
    Ivar  *ivarPlist =class_copyIvarList(self, &count);
    
    for (int i=0; i<count;i++){
        
        Ivar ivar1 = ivarPlist[i];
        
        NSString *propertyName = [NSString stringWithUTF8String: ivar_getName(ivar1)];
        
        NSString *propertyType = [NSString stringWithUTF8String: ivar_getTypeEncoding(ivar1)];
        
        NSString *key = [propertyName substringFromIndex:1];
        
        if ([propertyName isEqualToString:@"_UISupportedInterfaceOrientationsipad"]) {
            id Value= dict[@"UISupportedInterfaceOrientations~ipad"];
            [info setValue:Value forKey:key];
        }
        
        id Value= dict[key];
        
        if (Value) {
            
            [info setValue:Value forKey:key];//用kvc复制value不能为空
            
        }
    }
    return info;
}


@end
