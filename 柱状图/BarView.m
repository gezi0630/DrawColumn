//
//  BarView.m
//  柱状图
//
//  Created by MAC on 2017/6/29.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

#import "BarView.h"

@implementation BarView



- (void)drawRect:(CGRect)rect {
    
    
    NSArray * arr = [self arrRandom];

    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    
    
    for (int i = 0 ; i< arr.count; i++) {
        w = rect.size.width / (2 * arr.count - 1);
        x = 2 * w * i;
        h = [arr[i] floatValue] / 100.0 * rect.size.height;
        y = rect.size.height - h;
        
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        
        [[self colorRandom] set];
        
        [path fill];
        
    }
    
    
 }


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
    
}

//做一个随机颜色
-(UIColor*)colorRandom
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    
    
}


//做一个随机数组
-(NSArray*)arrRandom
{
    //数组中所有数的总和为100
    int totoal = 100;
    
    NSMutableArray * arrM = [NSMutableArray array];
    
    int temp = 0;
    //设置循环的随机次数不超过10， +1是因为随机数可能为0，如果是0没有意义
    for (int i =0; i < arc4random_uniform(10) + 1; i++) {
        
        //随机分配的数
        temp = arc4random_uniform(totoal) + 1;
        
        //将随机数加到数组里
        [arrM addObject:@(temp)];
        
        // 解决方式：当随机出来的数等于总数直接退出循环。
        if (temp == totoal) {
            
            break;
        }
        
        //每循环一次，就减掉一个随机数
        totoal -= temp;
    }
    
    //退出循环之后，如果总数中还有剩余值就加上最后的值
    if (totoal) {
        [arrM addObject:@(totoal)];
    }
    
    return arrM;
    
}


@end
