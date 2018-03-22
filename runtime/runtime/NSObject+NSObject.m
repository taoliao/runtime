//
//  NSObject+NSObject.m
//  runtime
//
//  Created by corepress on 2018/3/7.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "NSObject+NSObject.h"
#import <objc/message.h>

@implementation NSObject (NSObject)

- (void)setName:(NSString *)name {
    
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);//动态添加属性
    
 
}

- (NSString *)name {
    
    return objc_getAssociatedObject(self, @"name"); //获取属性
    
}

- (void)setAge:(int)age {
    
    objc_setAssociatedObject(self, @"age", @(age), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (int)age {
    
    return [objc_getAssociatedObject(self, @"age") intValue];
    
}


@end
