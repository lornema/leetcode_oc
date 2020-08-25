//
//  main.m
//  各种排序算法实现集合🌲
//
//  Created by lorne on 2020/8/25.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>

void bubbleSort (NSMutableArray *needRankArr) {
    
   for (int i=0; i<needRankArr.count-1; i++) {
       for (int j=i+1; j<needRankArr.count; j++) {
           NSInteger m = [needRankArr[i] integerValue];
           NSInteger n = [needRankArr[j] integerValue];
           if (m > n) {
               [needRankArr exchangeObjectAtIndex:i withObjectAtIndex:j];
           }
       }
    }
     NSLog(@"冒泡排序%@",needRankArr);
    
}

void InsertionSort (NSMutableArray *needRankArr) {
    
  
    
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        NSArray *rankArr = [[NSMutableArray alloc]initWithObjects:@(1),@(7),@(5),@(2),@(9),@(10),@(2),@(11),@(8), nil];
        
        //几种递归排序：
        //冒泡排序：时间复杂度 O(n^2)  空间复杂度O(1)
        bubbleSort([rankArr mutableCopy]);
        
        //插入排序:时间复杂度 O(n^2)
        /*
         我们将数组中的数据分为两个区间，已排序区间和未排序区间。初始已排序区间只有一个元素，就是数组的第一个元素。插入算法的核心思想是取未排序区间中的元素，在已排序区间中找到合适的插入位置将其插入，并保证已排序区间数据一直有序。重复这个过程，直到未排序区间中元素为空，算法结束。
         */
        
        
        
        
    }
    return 0;
}

