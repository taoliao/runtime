//
//  Infos.h
//  runtime
//
//  Created by corepress on 2018/3/8.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Infos : NSObject

@property(nonatomic,strong) NSString *CFBundleName;

@property(nonatomic,strong) NSString *DTSDKName;

@property(nonatomic,strong) NSString *DTXcode;

@property(nonatomic,strong) NSString *UILaunchStoryboardName;

@property(nonatomic,strong) NSString *DTSDKBuild;

@property(nonatomic,strong) NSString *CFBundleDevelopmentRegion;

@property(nonatomic,strong) NSString *CFBundleVersion;

@property(nonatomic,strong) NSString *BuildMachineOSBuild;

@property(nonatomic,strong) NSString *DTPlatformName;

@property(nonatomic,strong) NSString *CFBundlePackageType;

@property(nonatomic,strong) NSString *CFBundleShortVersionString;

@property(nonatomic,strong) NSArray *CFBundleSupportedPlatforms;

@property(nonatomic,strong) NSString *UIMainStoryboardFile;

@property(nonatomic,strong) NSString *CFBundleInfoDictionaryVersion;

@property(nonatomic,strong) NSString *CFBundleExecutable;

@property(nonatomic,strong) NSString *DTCompiler;

@property(nonatomic,strong) NSArray *UIRequiredDeviceCapabilities;

@property(nonatomic,strong) NSString *MinimumOSVersion;

@property(nonatomic,strong) NSString *CFBundleIdentifier;

@property(nonatomic,strong) NSArray *UIDeviceFamily;

@property(nonatomic,strong) NSString *DTPlatformVersion;

@property(nonatomic,strong) NSString *DTXcodeBuild;

@property(nonatomic,assign) BOOL LSRequiresIPhoneOS;

@property(nonatomic,strong) NSArray *UISupportedInterfaceOrientations;

@property(nonatomic,strong) NSArray *UISupportedInterfaceOrientationsipad;

@property(nonatomic,strong) NSString *DTPlatformBuild;

+ (instancetype)itemWithDict:(NSDictionary *)dict;


+(instancetype)modelWithDic:(NSDictionary*)dict;


@end
