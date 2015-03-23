//
//  TableViewCell.m
//  UUChartView
//
//  Created by shake on 15/1/4.
//  Copyright (c) 2015年 uyiuyao. All rights reserved.
//

#import "SCChartCell.h"
#import "SCChart.h"

@interface SCChartCell ()<SCChartDataSource>
{
    NSIndexPath *path;
    SCChart *chartView;
}
@end

@implementation SCChartCell

- (void)configUI:(NSIndexPath *)indexPath {
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    path = indexPath;
    chartView = [[SCChart alloc] initwithSCChartDataFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 150)
                                               withSource:self
                                                withStyle:SCChartLineStyle];
    [chartView showInView:self.contentView];
}

- (NSArray *)getXTitles:(int)num {
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i=0; i<num; i++) {
        NSString * str = [NSString stringWithFormat:@"03-0%d",i+1];
        [xTitles addObject:str];
    }
    return xTitles;
}

#pragma mark - @required
//横坐标标题数组
- (NSArray *)SCChart_xLableArray:(SCChart *)chart {
    return [self getXTitles:7];
}

//数值多重数组
- (NSArray *)SCChart_yValueArray:(SCChart *)chart {
    switch (path.row) {
        case 0:
        {
            NSArray *ary = @[@"0.2",@"0.14",@"0.12",@"0.44",@"0.4",@"0.13",@"0.21"];
            return @[ary];
            break;
        }
        case 1:
        {
            NSArray *ary = @[@"22",@"44",@"15",@"22",@"44",@"15",@"22"];
            NSArray *ary2 = @[@"16",@"63",@"64",@"23",@"133",@"64",@"15"];
            return @[ary,ary2];
            break;
        }
        case 2:
        {
            NSArray *ary = @[@"0.2",@"0.14",@"0.12",@"0.44",@"0.4",@"0.13",@"0.21"];
            NSArray *ary2 = @[@"0.16",@"0.63",@"0.64",@"0.23",@"0.133",@"0.64",@"0.15"];
            NSArray *ary3 = @[@"0.6",@"0.3",@"0.4",@"0.3",@"0.3",@"0.4",@"0.5"];
            return @[ary,ary2,ary3];
            break;
        }
        case 3:
        {
            NSArray *ary = @[@"2",@"14",@"12",@"44",@"4",@"13",@"21"];
            return @[ary];
            break;
        }
        default:
            break;
    }
    return nil;
}

#pragma mark - @optional
//颜色数组
- (NSArray *)SCChart_ColorArray:(SCChart *)chart {
    return @[SCGreen,SCRed,SCBrown];
}

#pragma mark 折线图专享功能
//标记数值区域
- (CGRange)SCChartMarkRangeInLineChart:(SCChart *)chart {
    return CGRangeZero;
}

//判断显示横线条
- (BOOL)SCChart:(SCChart *)chart ShowHorizonLineAtIndex:(NSInteger)index {
    return YES;
}

//判断显示最大最小值
- (BOOL)SCChart:(SCChart *)chart ShowMaxMinAtIndex:(NSInteger)index {
    return NO;
}
@end
