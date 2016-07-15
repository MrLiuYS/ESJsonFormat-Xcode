//
//  ESSettingController.m
//  ESJsonFormat
//
//  Created by 尹桥印 on 15/7/19.
//  Copyright (c) 2015年 EnjoySR. All rights reserved.
//

#import "ESSettingController.h"
#import "ESJsonFormatSetting.h"

@interface ESSettingController ()
@property (weak) IBOutlet NSButton *btnImpMJExtesion;
@property (weak) IBOutlet NSButton *btnGeneric;
@property (weak) IBOutlet NSButton *btnOutputToFile;
@property (weak) IBOutlet NSButton *btnUpercaseForId;

@property (weak) IBOutlet NSTextField *tfSuperClassName_QM;

@property (weak) IBOutlet NSTextField *labelSuperClassName_QM;



@end

@implementation ESSettingController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    
    self.btnImpMJExtesion.state = (NSCellStateValue)[[ESJsonFormatSetting defaultSetting] impOjbClassInArray];
    self.btnGeneric.state = (NSCellStateValue)[[ESJsonFormatSetting defaultSetting] useGeneric];
    self.btnOutputToFile.state = (NSCellStateValue)[[ESJsonFormatSetting defaultSetting] outputToFiles];
    self.btnUpercaseForId.state = (NSCellStateValue)[[ESJsonFormatSetting defaultSetting] uppercaseKeyWordForId];
    
    [self.tfSuperClassName_QM setStringValue:[[ESJsonFormatSetting defaultSetting] superClassName_QM]];
    [self.labelSuperClassName_QM setStringValue:[[ESJsonFormatSetting defaultSetting] superClassName_QM]];
    
    if (![ESUtils isXcode7AndLater]) {
        self.btnGeneric.enabled = NO;
    }
}

- (IBAction)btnImpMtdForMJClick:(NSButton *)sender {
    [[ESJsonFormatSetting defaultSetting] setImpOjbClassInArray:sender.state];
}

- (IBAction)btnUseGenericClick:(NSButton *)sender {
    [[ESJsonFormatSetting defaultSetting] setUseGeneric:sender.state];
}

- (IBAction)btnOutputToFilesClick:(NSButton *)sender {
    [[ESJsonFormatSetting defaultSetting] setOutputToFiles:sender.state];
}

- (IBAction)btnUpercaseKeyWordForIdClick:(NSButton *)sender {
    [[ESJsonFormatSetting defaultSetting] setUppercaseKeyWordForId:sender.state];
}


- (IBAction)tapGes:(NSClickGestureRecognizer *)sender {
    NSURL* url = [[ NSURL alloc ] initWithString :@"http://t.cn/RLarUfg"];
    [[NSWorkspace sharedWorkspace] openURL:url];
}
- (IBAction)touchSwitchSaveSuperClass_QM:(NSButton *)sender {
    
    sender.state = 1;
    
}

- (IBAction)touchSaveSuperClass_QM:(id)sender {
    
    [[ESJsonFormatSetting defaultSetting] setSuperClassName_QM:[self.tfSuperClassName_QM stringValue]];
    
    
    [self.labelSuperClassName_QM setStringValue:[[ESJsonFormatSetting defaultSetting] superClassName_QM]];
    
}


@end
