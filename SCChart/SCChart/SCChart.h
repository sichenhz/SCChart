//
//  UUChart.h
//  UUChart
//
//  Created by 2014-763 on 15/3/12.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCChart.h"
#import "SCColor.h"
#import "SCLineChart.h"
#import "SCBarChart.h"
#import "SCCircleChart.h"
#import "SCPieChart.h"
//类型
typedef enum {
	SCChartLineStyle,
	SCChartBarStyle
} SCChartStyle;


@class SCChart;
@protocol SCChartDataSource <NSObject>

@required
//横坐标标题数组
- (NSArray *)SCChart_xLableArray:(SCChart *)chart;

//数值多重数组
- (NSArray *)SCChart_yValueArray:(SCChart *)chart;

@optional
//颜色数组
- (NSArray *)SCChart_ColorArray:(SCChart *)chart;

//显示数值范围
- (CGRange)SCChartChooseRangeInLineChart:(SCChart *)chart;

#pragma mark 折线图专享功能
//标记数值区域
- (CGRange)SCChartMarkRangeInLineChart:(SCChart *)chart;

//判断显示横线条
- (BOOL)SCChart:(SCChart *)chart ShowHorizonLineAtIndex:(NSInteger)index;

//判断显示最大最小值
- (BOOL)SCChart:(SCChart *)chart ShowMaxMinAtIndex:(NSInteger)index;
@end


@interface SCChart : UIView

//是否自动显示范围
@property (nonatomic, assign) BOOL showRange;

@property (assign) SCChartStyle chartStyle;

-(id)initwithSCChartDataFrame:(CGRect)rect withSource:(id<SCChartDataSource>)dataSource withStyle:(SCChartStyle)style;

- (void)showInView:(UIView *)view;

-(void)strokeChart;

@end
