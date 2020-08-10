//
//  main.m
//  最小区间
//
//  Created by lorne on 2020/8/10.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>
//3🌟
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       // 你有 k 个升序排列的整数列表。找到一个最小区间，使得 k 个列表中的每个列表至少有一个数包含在其中。
       //我们定义如果 b-a < d-c 或者在 b-a == d-c 时 a < c，则区间 [a,b] 比 [c,d] 小。
       NSArray <NSArray *>* allRangeArr = @[@[@(4),@(10),@(15),@(24),@(26)], @[@(0),@(9),@(12),@(20)], @[@(5),@(18),@(22),@(30)]];
        //
        NSMutableArray *rowArr = [[NSMutableArray alloc]initWithObjects:allRangeArr[0][0],allRangeArr[1][0],allRangeArr[2][0], nil];
       
        //最小区间值
        NSArray *smallestRange = @[@(0),@(0)];
        
        int minV = 0;
        int maxV = INT_MIN;
        
        //二维数组标记点
        int allRangeArr_0 = 0;
        int allRangeArr_1 = 0;
        
        BOOL _slide = YES;

        while (_slide) {
            //求出最大值
           int maxValue = [[rowArr valueForKeyPath:@"@max.intValue"] intValue];
           maxV = maxValue;
          
            //求出最小值
           int minValue = [[rowArr valueForKeyPath:@"@min.intValue"] intValue];
           minV = minValue;
                      
           //求出最小值-对应的坐标位置-然后将最小坐标值右移一位
           for (int i=0; i<rowArr.count; i++) {
               NSNumber * rowNum = rowArr[i];
               if (rowNum.intValue == minV) {
                   //取出最小值对应二维数组的坐标
                   NSArray *minArr = allRangeArr[i];
                   allRangeArr_0 = i;
                   allRangeArr_1 = (int)[minArr indexOfObject:rowNum];
                   
                   allRangeArr_1 ++;//坐标右移一位
                   if (allRangeArr_1 >= minArr.count) {
                       //移动结束
                       _slide = NO;
                   }else{
                       //将最小值右移一位
                       [rowArr replaceObjectAtIndex:allRangeArr_0 withObject:allRangeArr[allRangeArr_0][allRangeArr_1]];
                   }
                   break;
               }
           }
            
        }
        
        smallestRange = @[@(minV),@(maxV)];
    
        NSLog(@"smallestRange=%@",smallestRange);
       
     }
    return 0;
}
