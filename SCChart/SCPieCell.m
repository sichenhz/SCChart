//
//  SCPieCell.m
//  SCChart
//
//  Created by 2014-763 on 15/3/24.
//  Copyright (c) 2015年 meilishuo. All rights reserved.
//

#import "SCPieCell.h"
#import "SCChart.h"

@interface SCPieCell()
{
    SCPieChart *chartView;
}
@end

@implementation SCPieCell

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
    NSMutableArray *ary = [NSMutableArray array];
    for (NSInteger i = 0; i < 3; i++) {
        CGFloat num = arc4random_uniform(100);
        NSString *str = [NSString stringWithFormat:@"%f",num];
        [ary addObject:str];
    }
    [chartView updateChartByNumbers:ary];
}

- (void)configUI:(NSIndexPath *)indexPath {
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    NSArray *items = @[[SCPieChartDataItem dataItemWithValue:10 color:SCRed description:@"A"],
                       [SCPieChartDataItem dataItemWithValue:20 color:SCBlue description:@"B"],
                       [SCPieChartDataItem dataItemWithValue:40 color:SCGreen description:@"C"],
                       ];
    
    chartView = [[SCPieChart alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, (self.frame.size.height-150)/2, 150.0, 150.0) items:items];
    chartView.descriptionTextColor = [UIColor whiteColor];
    chartView.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:12.0];
    [chartView strokeChart];
    [self addSubview:chartView];
}

@end
