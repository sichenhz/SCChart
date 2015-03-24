//
//  DCBarCell.m
//  UUChart
//
//  Created by 2014-763 on 15/3/13.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import "SCBarCell.h"
#import "SCChart.h"

@interface SCBarCell ()<SCChartDataSource>
{
    NSIndexPath *path;
    SCChart *chartView;
}
@end

@implementation SCBarCell

- (void)configUI:(NSIndexPath *)indexPath {
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    path = indexPath;
    chartView = [[SCChart alloc] initwithSCChartDataFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 150)
                                               withSource:self
                                                withStyle:SCChartBarStyle];
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
            NSArray *ary2 = @[@"52",@"13",@"43",@"12",@"4",@"65",@"12"];
            return @[ary,ary2];
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

@end
