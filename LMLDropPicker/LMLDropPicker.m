//
//  LMLDropPicker.m
//  test05
//
//  Created by 优谱德 on 16/5/24.
//  Copyright © 2016年 优谱德. All rights reserved.
//

#import "LMLDropPicker.h"
#import "LMLDropPickerTabCell.h"

#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
// tableView的指示线的颜色
#define TableView_Indicatrix_Color RGB(240, 240, 240);  // tableView的指示线颜色

@interface LMLDropPicker ()<UITableViewDelegate, UITableViewDataSource>
{

    NSArray *mycities;
    NSString *_selectedProvince;  // 被选中的省份
    CGRect _backFrame;
    CGRect _mcitiesFrame;
    int _showCount;
}

@property (nonatomic, strong) UITableView *tableView; // 展示城市的
@property (nonatomic, copy) void (^complete)(NSString *province);

@end



@implementation LMLDropPicker

+ (LMLDropPicker *)showSelCityPickerWithDataSource:(NSArray*)cityies withBackFrame:(CGRect)backFrame andCitiesFrame:(CGRect)citiesFrame andShowCount:(int)showCount andSelectedProvince:(NSString *)province complete:(void(^)(NSString *province))complete{

    
    LMLDropPicker *drop = [[LMLDropPicker alloc] initWithSelCityPickerWithDataSource:(NSArray*)cityies withBackFrame:(CGRect)backFrame andCitiesFrame:(CGRect)citiesFrame andShowCount:(int)showCount andSelectedProvince:(NSString *)province complete:complete];
    [drop show];
    
    return drop;
}

- (instancetype)initWithSelCityPickerWithDataSource:(NSArray*)cityies withBackFrame:(CGRect)backFrame andCitiesFrame:(CGRect)citiesFrame andShowCount:(int)showCount andSelectedProvince:(NSString *)province complete:(void(^)(NSString *province))complete{

    if (self = [super init]) {
        
        /* 1.数据 */
        if (cityies != nil) {
            mycities = cityies;
        }else {
        
            mycities = [lmlarea componentsSeparatedByString:@","];
        }
        _complete = complete;
        _selectedProvince = province;
        _backFrame = backFrame;
        _mcitiesFrame = citiesFrame;
        _showCount = showCount;
        
        
        
        /* 2.界面 */
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    /* 底部 */
    UIView *backView = [[UIView alloc] initWithFrame:_backFrame];
    backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    [self addSubview:backView];
    
    /* tableView - Img */  // 125 * 276
    UIImageView *back_img = [[UIImageView alloc] initWithFrame:_mcitiesFrame];
    back_img.image = [UIImage imageNamed:@"tupian"];
    [self addSubview:back_img];
    
    /* tableView */
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(_mcitiesFrame.origin.x, _mcitiesFrame.origin.y + 5, _mcitiesFrame.size.width, _mcitiesFrame.size.height - 5)];
    self.tableView.layer.cornerRadius = 3;
    self.tableView.layer.masksToBounds = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = TableView_Indicatrix_Color;  // 设置指示线的颜色
    [self addSubview:self.tableView];
    
    /*  */
    
}

+ (void)hideMe {
    
    
    
}

#pragma mark - touches 

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self hide];
}


#pragma mark - tabelView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return mycities.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 271 / _showCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellid];
        cell = [[NSBundle mainBundle] loadNibNamed:@"LMLDropPickerTabCell" owner:self options:nil].firstObject;
    }
    
    /* 数据 */
    ((LMLDropPickerTabCell *)cell).cus_titleLabel.text = mycities[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    _complete(mycities[indexPath.row]);
    [self hide];
}

#pragma mark - 解决tableView 的线没有左对齐

-(void)viewDidLayoutSubviews {
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}



@end
