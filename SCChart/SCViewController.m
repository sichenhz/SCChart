//
//  SCViewController.m
//  SCChart
//
//  Created by 2014-763 on 15/3/13.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import "SCViewController.h"
#import "SCChartCell.h"
#import "SCBarCell.h"
#import "SCCircleCell.h"
#import "SCPieCell.h"

@interface SCViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SCViewController
static NSString *reuseIdentifierChart = @"SCChartCell";
static NSString *reuseIdentifierBar = @"SCBarCell";
static NSString *reuseIdentifierCircle = @"SCCircleCell";
static NSString *reuseIdentifierPie = @"SCPieCell";

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[SCChartCell class] forCellReuseIdentifier:reuseIdentifierChart];
    [tableView registerClass:[SCBarCell class] forCellReuseIdentifier:reuseIdentifierBar];
    [tableView registerClass:[SCCircleCell class] forCellReuseIdentifier:reuseIdentifierCircle];
    [tableView registerClass:[SCPieCell class] forCellReuseIdentifier:reuseIdentifierPie];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            SCChartCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierChart forIndexPath:indexPath];
            if (!cell) {
                cell = [[SCChartCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifierChart];
            }
            [cell configUI:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
            
        case 1:
        {
            SCBarCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierBar forIndexPath:indexPath];
            if (!cell) {
                cell = [[SCBarCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifierBar];
            }
            [cell configUI:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
            
        case 2:
        {
            SCChartCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierCircle forIndexPath:indexPath];
            if (!cell) {
                cell = [[SCChartCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifierCircle];
            }
            [cell configUI:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;

        case 3:
        {
            SCPieCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifierPie forIndexPath:indexPath];
            if (!cell) {
                cell = [[SCPieCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifierPie];
            }
            [cell configUI:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;

        default:
            break;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , 30);
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont systemFontOfSize:14];
    label.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.3];
    switch (section) {
        case 0:
            label.text = @"折线图";
            break;
        case 1:
            label.text = @"柱状图";
            break;
        case 2:
            label.text = @"圆形图";
            break;
        case 3:
            label.text = @"圆饼图";
            break;
        default:
            break;
    }
    label.textColor = [UIColor colorWithRed:0.257 green:0.650 blue:0.478 alpha:1.000];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

@end
