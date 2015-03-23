### 如何使用-SCChart

![icon](http://img03.taobaocdn.com/imgextra/i3/135480037/TB2FaqKcXXXXXXnXpXXXXXXXXXX_!!135480037.gif)

1.实例化

    -(id)initwithUUChartDataFrame:(CGRect)rect withSource:(id<UUChartDataSource>)dataSource withStyle:(UUChartStyle)style;

2.选择图表的风格

    UUChartLineStyle
    UUChartBarStyle
    
3.数据源方法(required)横坐标和竖坐标的title

    - (NSArray *)UUChart_xLableArray:(UUChart *)chart;
    - (NSArray *)UUChart_yValueArray:(UUChart *)chart;
    
4.数据源方法(optional)折现和圆柱的颜色

    - (NSArray *)UUChart_ColorArray:(UUChart *)chart;

5.数据源方法(optional)是否显示间隔线条

    - (BOOL)SCChart:(SCChart *)chart ShowHorizonLineAtIndex:(NSInteger)index {
    return YES;
    }
