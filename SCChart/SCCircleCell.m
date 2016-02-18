//
//  SCCircleCell.m
//  SCChart
//
//  Created by 2014-763 on 15/3/24.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import "SCCircleCell.h"
#import "SCChart.h"

@interface SCCircleCell()
{
    SCCircleChart *chartView;
}
@end

@implementation SCCircleCell

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
    CGFloat num = arc4random_uniform(60);
    [chartView updateChartByCurrent:@(num)];
}

- (void)configUI:(NSIndexPath *)indexPath {
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    chartView = [[SCCircleChart alloc] initWithFrame:CGRectMake(0, (self.frame.size.height-100)/2, SCREEN_WIDTH, 100.0)
                                               total:@100
                                             current:@60
                                           clockwise:YES];
    [chartView setStrokeColor:SCBlue];
    chartView.chartType = SCChartFormatTypeNone;
    chartView.format = @"无线端\n%d%%";
    [chartView strokeChart];
    [self addSubview:chartView];
}

@end
