//
//  ESJsonFormatSetting.m
//  ESJsonFormat
//
//  Created by 尹桥印 on 15/7/19.
//  Copyright (c) 2015年 EnjoySR. All rights reserved.
//

#import "ESJsonFormatSetting.h"


NSString *const kESJsonFormatGeneric = @"com.EnjoySR.ESJsonFormat.Generic";
NSString *const kESJsonFormatOutputToFiles = @"com.EnjoySR.ESJsonFormat.OutputToFiles";
NSString *const kESJsonFormatImpObjClassInArray = @"com.EnjoySR.ESJsonFormat.ImpObjClassInArray";
NSString *const kESJsonFormatUppercaseKeyWordForId = @"com.EnjoySR.ESJsonFormat.UppercaseKeyWordForId";

/**
 *  加入修改父类
 */
NSString *const kESJsonFormatSuperClassName_QM = @"com.EnjoySR.ESJsonFormat.SuperClassName_QM";


@implementation ESJsonFormatSetting

+ (ESJsonFormatSetting *)defaultSetting
{
    static dispatch_once_t once;
    static ESJsonFormatSetting *defaultSetting;
    dispatch_once(&once, ^ {
        defaultSetting = [[ESJsonFormatSetting alloc] init];
        NSDictionary *defaults = @{kESJsonFormatGeneric: @YES,
                                   kESJsonFormatOutputToFiles: @NO,
                                   kESJsonFormatImpObjClassInArray: @YES,
                                   kESJsonFormatUppercaseKeyWordForId: @NO,
                                   kESJsonFormatSuperClassName_QM : @"NSObject"};
        [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    });
    return defaultSetting;
}

- (void)setUseGeneric:(BOOL)useGeneric{
    [[NSUserDefaults standardUserDefaults] setBool:useGeneric forKey:kESJsonFormatGeneric];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)useGeneric{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kESJsonFormatGeneric];
}

- (void)setImpOjbClassInArray:(BOOL)impOjbClassInArray{
    [[NSUserDefaults standardUserDefaults] setBool:impOjbClassInArray forKey:kESJsonFormatImpObjClassInArray];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)impOjbClassInArray{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kESJsonFormatImpObjClassInArray];
}

- (void)setOutputToFiles:(BOOL)outputToFiles{
    [[NSUserDefaults standardUserDefaults] setBool:outputToFiles forKey:kESJsonFormatOutputToFiles];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)outputToFiles{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kESJsonFormatOutputToFiles];
}

- (void)setUppercaseKeyWordForId:(BOOL)uppercaseKeyWordForId{
    [[NSUserDefaults standardUserDefaults] setBool:uppercaseKeyWordForId forKey:kESJsonFormatUppercaseKeyWordForId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)uppercaseKeyWordForId{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kESJsonFormatUppercaseKeyWordForId];
}


- (void)setSuperClassName_QM:(NSString *)superClassName_QM{
    [[NSUserDefaults standardUserDefaults] setObject:superClassName_QM forKey:kESJsonFormatSuperClassName_QM];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)superClassName_QM{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kESJsonFormatSuperClassName_QM];
}



@end
