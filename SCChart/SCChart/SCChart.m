//
//  UUChart.m
//  UUChart
//
//  Created by 2014-763 on 15/3/12.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import "SCChart.h"
#define kRowMax 6 // 可支持最大行数

@interface SCChart ()

@property (strong, nonatomic) SCLineChart * lineChart;

@property (strong, nonatomic) SCBarChart * barChart;

@property (assign, nonatomic) id<SCChartDataSource> dataSource;

@end

@implementation SCChart

-(id)initwithSCChartDataFrame:(CGRect)rect withSource:(id<SCChartDataSource>)dataSource withStyle:(SCChartStyle)style{
    self.dataSource = dataSource;
    self.chartStyle = style;
    return [self initWithFrame:rect];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = NO;
    }
    return self;
}

-(void)setUpChart{
	if (self.chartStyle == SCChartLineStyle) {
        
        [self.lineChart removeFromSuperview];
        self.lineChart = nil;

        if(!_lineChart){
            _lineChart = [[SCLineChart alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            [self addSubview:_lineChart];
        }
        //选择标记范围
        if ([self.dataSource respondsToSelector:@selector(SCChartMarkRangeInLineChart:)]) {
            [_lineChart setMarkRange:[self.dataSource SCChartMarkRangeInLineChart:self]];
        }
        //选择显示范围
        if ([self.dataSource respondsToSelector:@selector(SCChartChooseRangeInLineChart:)]) {
            [_lineChart setChooseRange:[self.dataSource SCChartChooseRangeInLineChart:self]];
        }
        //显示颜色
        if ([self.dataSource respondsToSelector:@selector(SCChart_ColorArray:)]) {
            [_lineChart setColors:[self.dataSource SCChart_ColorArray:self]];
        }
        //显示横线
        if ([self.dataSource respondsToSelector:@selector(SCChart:ShowHorizonLineAtIndex:)]) {
            NSMutableArray *showHorizonArray = [[NSMutableArray alloc]init];
            for (int i=0; i<kRowMax+1; i++) {
                if ([self.dataSource SCChart:self ShowHorizonLineAtIndex:i]) {
                    [showHorizonArray addObject:@"1"];
                }else{
                    [showHorizonArray addObject:@"0"];
                }
            }
            [_lineChart setShowHorizonLine:showHorizonArray];

        }
        //判断显示最大最小值
        if ([self.dataSource respondsToSelector:@selector(SCChart:ShowMaxMinAtIndex:)]) {
            NSMutableArray *showMaxMinArray = [[NSMutableArray alloc]init];
            NSArray *y_values = [self.dataSource SCChart_yValueArray:self];
            if (y_values.count>0){
                for (int i=0; i<y_values.count; i++) {
                    if ([self.dataSource SCChart:self ShowMaxMinAtIndex:i]) {
                        [showMaxMinArray addObject:@"1"];
                    }else{
                        [showMaxMinArray addObject:@"0"];
                    }
                }
                _lineChart.ShowMaxMinArray = showMaxMinArray;
            }
        }
        
		[_lineChart setYValues:[self.dataSource SCChart_yValueArray:self]];
		[_lineChart setXLabels:[self.dataSource SCChart_xLableArray:self]];
        
		[_lineChart strokeChart];

	}else if (self.chartStyle == SCChartBarStyle)
	{
        
        [self.barChart removeFromSuperview];
        self.barChart = nil;

        if (!_barChart) {
            _barChart = [[SCBarChart alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
            [self addSubview:_barChart];
        }
        if ([self.dataSource respondsToSelector:@selector(SCChartChooseRangeInLineChart:)]) {
            [_barChart setChooseRange:[self.dataSource SCChartChooseRangeInLineChart:self]];
        }
        if ([self.dataSource respondsToSelector:@selector(SCChart_ColorArray:)]) {
            [_barChart setColors:[self.dataSource SCChart_ColorArray:self]];
        }
		[_barChart setYValues:[self.dataSource SCChart_yValueArray:self]];
		[_barChart setXLabels:[self.dataSource SCChart_xLableArray:self]];
        
        [_barChart strokeChart];
	}
}

- (void)showInView:(UIView *)view
{
    [self setUpChart];
    [view addSubview:self];
}

-(void)strokeChart
{
	[self setUpChart];
	
}



@end
