//
//  NSDictionary+Perperty.m
//  runtime
//
//  Created by corepress on 2018/3/8.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "NSDictionary+Perperty.h"

@implementation NSDictionary (Perperty)

- (void)creatPropertyCode:(NSDictionary *)dict {
    
      NSMutableString *codeStr = [NSMutableString string];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSString *code;
        if ([value isKindOfClass:[NSString class]]) {
            
            code = [NSString stringWithFormat:@"@property(nonatomic,strong) NSString *%@;",key];
            
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            
             code = [NSString stringWithFormat:@"@property(nonatomic,assign) BOOL %@;",key];
            
        }else if ([value isKindOfClass:[NSNumber class]]) {
            
             NSString *types = [NSString stringWithFormat:@"%@",value];
            if ([types rangeOfString:@"."].length > 0) {  //浮点型
                 code = [NSString stringWithFormat:@"@property(nonatomic,assign) float %@;",key];
            }else {
                 code = [NSString stringWithFormat:@"@property(nonatomic,assign) NSInteger %@;",key];
            }
            
        }else if ([value isKindOfClass:[NSArray class]]) {
            
            code = [NSString stringWithFormat:@"@property(nonatomic,strong) NSArray *%@;",key];
            
        }else if ([value isKindOfClass:[NSDictionary class]]) {
            
            code = [NSString stringWithFormat:@"@property(nonatomic,strong) NSDictionary *%@;",key];
            
        }
    
        [codeStr appendFormat:@"\n%@\n",code];
        
    }];
    
//    NSLog(@"%@",codeStr);
    
}


@end
