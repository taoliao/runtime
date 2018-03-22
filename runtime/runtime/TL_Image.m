//
//  TL_Image.m
//  runtime
//
//  Created by corepress on 2018/3/7.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TL_Image.h"
#import <objc/message.h>


@implementation TL_Image

+(void)initialize {   //(当类第一次被调用的时候就会调用该方法,整个程序运行中只会调用一次)
    
    NSLog(@"(当类第一次被调用的时候就会调用该方法,整个程序运行中只会调用一次");
    
}
+(void)load {  //(当程序启动的时候就会调用该方法,换句话说,只要程序一启动就会调用load方法,整个程序运行中只会调用一次)
    
   Method imageName = class_getClassMethod(self, @selector(imageNamed:));
   Method tl_imageName = class_getClassMethod(self, @selector(tl_ImageWithName:));
   method_exchangeImplementations(imageName, tl_imageName);  //交互2个方法
}

+(UIImage *)tl_ImageWithName:(NSString *)imageName {
    UIImage *image = [TL_Image tl_ImageWithName:imageName];
    if (image == nil) {
        NSLog(@"Warning:不存在");
    }
    return image;
}


@end
