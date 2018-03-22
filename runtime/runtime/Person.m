//
//  Person.m
//  runtime
//
//  Created by corepress on 2018/3/7.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

//void watch(id self,SEL _cmd) {
//    NSLog(@"watch Movies");
//}

void sleepAct(id self,SEL _cmd) {
    NSLog(@"sleep");
}
void drinkAct(id self,SEL _cmd, NSNumber *water) {
    NSLog(@"drink：%@",[NSString stringWithFormat:@"%@ml",water]);
}

+(BOOL)resolveInstanceMethod:(SEL)sel { //判断对象方法有没有实现
    
    if (sel == NSSelectorFromString(@"drink:")) {
        
        class_addMethod(self, sel, (IMP) drinkAct, "v@:@");
        
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

//+(BOOL)resolveClassMethod:(SEL)sel { //判断类方法有没有实现
//
//    if (sel == NSSelectorFromString(@"watch")) {
//
//        NSLog(@"%@",NSStringFromSelector(sel));
////        class_addMethod(self, sel, (IMP) watchAct, "v@:");
//
//        return YES;
//    }
//    return [super resolveClassMethod:sel];
//}


-(void)run:(CGFloat)meter {
    NSLog(@"跑了%f",meter);
}

- (void)eat {
    NSLog(@"吃");
}




@end
