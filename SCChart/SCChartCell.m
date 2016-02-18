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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"点击刷新数据" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12.0];;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, SCREEN_WIDTH, 27);
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)btnPressed:(id)sender {
    [chartView strokeChart];
}

- (void)configUI:(NSIndexPath *)indexPath {
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    path = indexPath;
    chartView = [[SCChart alloc] initwithSCChartDataFrame:CGRectMake(10, (self.frame.size.height-150)/2, [UIScreen mainScreen].bounds.size.width - 20, 150)
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
            NSMutableArray *ary = [NSMutableArray array];
            for (NSInteger i = 0; i < 7; i++) {
                CGFloat num = arc4random_uniform(100);
                NSString *str = [NSString stringWithFormat:@"%f",num];
                [ary addObject:str];
            }
            return @[ary];
            break;
        }
        case 1:
        {
            NSMutableArray *ary = [NSMutableArray array];
            NSMutableArray *ary2 = [NSMutableArray array];
            for (NSInteger i = 0; i < 7; i++) {
                CGFloat num = arc4random_uniform(1000) / 100;
                NSString *str = [NSString stringWithFormat:@"%f",num];
                [ary addObject:str];
            }
            for (NSInteger i = 0; i < 7; i++) {
                CGFloat num = arc4random_uniform(1000) / 100;
                NSString *str = [NSString stringWithFormat:@"%f",num];
                [ary2 addObject:str];
            }
            return @[ary,ary2];
            break;
        }
        case 2:
        {
            NSMutableArray *ary = [NSMutableArray array];
            NSMutableArray *ary2 = [NSMutableArray array];
            NSMutableArray *ary3 = [NSMutableArray array];
            for (NSInteger i = 0; i < 7; i++) {
                CGFloat num = arc4random_uniform(500);
                NSString *str = [NSString stringWithFormat:@"%f",num];
                [ary addObject:str];
            }
            for (NSInteger i = 0; i < 7; i++) {
                CGFloat num = arc4random_uniform(1000);
                NSString *str = [NSString stringWithFormat:@"%f",num];
                [ary2 addObject:str];
            }
            for (NSInteger i = 0; i < 7; i++) {
                CGFloat num = arc4random_uniform(2000);
                NSString *str = [NSString stringWithFormat:@"%f",num];
                [ary3 addObject:str];
            }
            return @[ary,ary2,ary3];
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
    return @[SCBlue,SCRed,SCGreen];
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
