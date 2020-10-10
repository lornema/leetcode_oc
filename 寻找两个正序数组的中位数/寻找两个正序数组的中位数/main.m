//
//  main.m
//  寻找两个正序数组的中位数
//
//  Created by lorne on 2020/8/25.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>


int fundKValue(int k, NSMutableArray *arr1M, NSMutableArray *arr2M) {
    
    int value = 0;
    while (k>=1) {
        if (k==1) {
           //考虑数组越界的问题
            int value1 = arr1M.count ? [arr1M[0] intValue] : [arr2M.lastObject intValue];
            int value2 = arr2M.count ? [arr2M[0] intValue] : [arr1M.lastObject interval];
            if (value1 <= value2) {//取小值
                value = value1;
            }else{
                value = value2;
            }
          k = 0;
          break;
        }
        
        //考虑数组越界-取出对应位置的值
        int value1 = 0;
        int num1 = k/2;
        if (arr1M.count > k/2-1) {
            value1 =  [arr1M[k/2-1] intValue];
        }else{
            if (arr1M.count==0) {
                value1 = [arr2M.lastObject intValue];
            }else{
                value1 = [arr1M.lastObject intValue];
                num1 = (int)arr1M.count;
            }
        }
        
        int value2 = 0;
        int num2 = k/2;
        if (arr2M.count > k/2-1) {
            value2 =  [arr2M[k/2-1] intValue];
        }else{
            if (arr1M.count==0) {
                value2 = [arr1M.lastObject intValue];
            }else{
                value2 = [arr2M.lastObject interval];
                num2 = (int)arr2M.count;
            }
        }
        
        
       if (value1 <= value2) {//做比较然后删除小的部分
           [arr1M removeObjectsInRange:NSMakeRange(0, num1)];
            k = k - num1;
       }else{
           [arr2M removeObjectsInRange:NSMakeRange(0, num2)];
           k = k - num2;
       }
     
    }
    return  value;
    
}


//难度3🌟
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         寻找两个正序数组的中位数：
        给定两个大小为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。
        请你找出这两个正序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
        你可以假设 nums1 和 nums2 不会同时为空。
         示例 1:

         nums1 = [1, 3]
         nums2 = [2]

         合并数组 = [1,2,3]
         则中位数是 2
         
         示例 2:

         nums1 = [1, 2]
         nums2 = [3, 4]

         合并数组 = [1,2,3,4]
         则中位数是 (2 + 3)/2 = 2.5
         
         示例 3:
         
         nums1 = []
         nums2 = [2]
         
         则中位数是 2.0000
         */
       
        NSArray *arr1 = @[@(1), @(10)];
        NSArray *arr2 = @[ @(2), @(3), @(4), @(5), @(6), @(7), @(8), @(9)];
        
        //解题思路 开始想到数组合并 但是时间复杂度不符合题目要求。--感觉合并数组求中位数时间复杂度达不到O(log(m + n))
        //所以我觉得应该是不合并数组。
        //另一个不用合并数组的思路把两个数组看成两个竞争队列，有两个指针放在下标0位置，有点像归并排序中的合并方法。然后计算两个数组总个数N，
        //N为奇数时:中位数为下标N/2 (3/2==1)。 N为偶数时:中位数为下标N/2、N/2-1两个值的平均值
        
        //开解 这里排除了数组为空的情况
        int N = (int)arr1.count + (int)arr2.count;
        CGFloat value =  0.0;
        
        /*
        int arr1_index = 0;
        int arr2_index = 0;
        if (N%2 > 0) {//奇数
            int mid_index =  N/2;
            int mid_value = 0;
            while (mid_index >= 0) {
                int tmp1 = [arr1[arr1_index] intValue];
                int tmp2 = [arr2[arr2_index] intValue];
                if (tmp1 <= tmp2) {
                    if (mid_index == 0) {
                        mid_value = tmp1;
                    }
                    arr1_index ++;//移动下标
                }else{
                    if (mid_index == 0) {
                        mid_value = tmp2;
                    }
                    arr2_index ++;
                }
                
                mid_index --;//移动下标
            }
            value = mid_value;

        }else{//偶数
            int mid_index =  N/2;
            int tmp_value = 0;
            int tmp_value2 = 0;
            while (mid_index >= 0) {
                int tmp1 = [arr1[arr1_index] intValue];
                int tmp2 = [arr2[arr2_index] intValue];
                if (tmp1 <= tmp2) {
                    if (mid_index == 0) {
                        tmp_value = tmp1;//中位数
                    }else if (mid_index == 1) {
                        tmp_value2 = tmp1;//中位数2
                    }
                    arr1_index ++;//移动下标
                }else{
                    if (mid_index == 0) {
                        tmp_value = tmp2;//中位数
                    }else if (mid_index == 1) {
                         tmp_value2 = tmp2;//中位数
                    }
                    arr2_index ++;//移动下标
                }
                mid_index --;
            }
            value = ((CGFloat)tmp_value + (CGFloat)tmp_value2)/2.0;
            NSLog(@"获得中位数%f",value);
        }
         */
        
      
        //获取中位数是对的 但是时间复杂度是 m+n/2---》O(m+n); 还是不符合题目要求 继续优化 通过二分查找实现
        //假设现在要找中位数在k的位置，为了方便计算k的第一位从1开始，利用二分法 取数组arr1的第 k/2位 和 数组arr2的第k/2位比较，较小的数1～k/2位舍弃 同时k减去k/2位，然后继续二分查找k==1时取小值
         if (N%2 > 0) {//奇数
             int midV = fundKValue(N/2+1, [arr1 mutableCopy], [arr2 mutableCopy]);
             value = midV;
         }else{//偶数
             int midV = fundKValue(N/2, [arr1 mutableCopy], [arr2 mutableCopy]);
             int midV1 = fundKValue(N/2+1, [arr1 mutableCopy], [arr2 mutableCopy]);
             value = ((CGFloat)midV + (CGFloat)midV1)/2.0;

         }
         NSLog(@"二分法获得中位数%f",value);
        //还有其他解法。。。。。不写了

        
    }
    return 0;
}
