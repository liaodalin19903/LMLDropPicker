//
//  ViewController.m
//  LMLDropPickerDemo
//
//  Created by 优谱德 on 16/9/20.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "ViewController.h"
#import "LMLDropPicker.h"

//设备屏幕尺寸
#define kScreen_Height   ([UIScreen mainScreen].bounds.size.height)
#define kScreen_Width    ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()
{

    __weak IBOutlet UILabel *province_label;
}
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

@property (nonatomic, copy) NSString *location;  //

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.selectBtn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)selectType:(id)sender {
    
    CGRect back = CGRectMake(0, 64, kScreen_Width, kScreen_Height - 64);
    CGRect dropFrame = CGRectMake(kScreen_Width - 130 + 30, 64, 125 - 30, 276);
    // 125 * 276
    
    // picker of lml
    [LMLDropPicker showSelCityPickerWithDataSource:nil withBackFrame:back andCitiesFrame:dropFrame andShowCount:6 andSelectedProvince:self.location complete:^(NSString *province) {
        
        if ([province isEqualToString:province_label.text]) {
            return ;
        }
        
        province_label.text = province;
        
    }];
}



@end
