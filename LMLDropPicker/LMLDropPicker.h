//
//  LMLDropPicker.h
//  test05
//
//  Created by 优谱德 on 16/5/24.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopWindow.h"

#define lmlarea @"全国,北京市,天津市,上海市,重庆市,河北省,河南省,云南省,辽宁省,黑龙江,湖南省,安徽省,山东省,新疆,江苏省,浙江省,江西省,湖北省,广西,甘肃省,山西省,内蒙古,陕西省,吉林省,福建省,贵州省,广东省,青海省,西藏,四川省,宁夏,海南省,台湾省,香港,澳门"

@interface LMLDropPicker : PopWindow



// 1.cities 可以传nil
+ (LMLDropPicker *)showSelCityPickerWithDataSource:(NSArray*)cityies withBackFrame:(CGRect)backFrame andCitiesFrame:(CGRect)citiesFrame andShowCount:(int)showCount andSelectedProvince:(NSString *)province complete:(void(^)(NSString *province))complete;
+ (void)hideMe;


@end
