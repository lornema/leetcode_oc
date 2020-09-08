//
//  main.m
//  各种排序算法实现集合🌲
//
//  Created by lorne on 2020/8/25.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>

void bubbleSort (NSMutableArray *needRankArr) {
  
    for (int i=0; i<needRankArr.count; i++) {//需要遍历的次数 每次遍历确定一个最大值 然后排到最后面
        for (int j=0; j<needRankArr.count-i-1; j++) {
           NSInteger m = [needRankArr[j] integerValue];
           NSInteger n = [needRankArr[j+1] integerValue];
            NSLog(@"第%d遍历，位置%d与位置%d",i,j,j+1);
            if (m>n) {//相邻的两个数做比较
               [needRankArr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
     NSLog(@"冒泡排序%@",needRankArr);
}

void InsertionSort (NSMutableArray *needRankArr) {
    
    //从第0+1个开始 和前面已排区域做对比 然后找个合适的位置插入
    for (int i=1; i<needRankArr.count; i++) {
        NSInteger needRank_item_v = [needRankArr[i] integerValue];
        for (int j=i-1; j>=0; j--) {//遍历已排区域的每一个
            NSInteger hadRank_item_v = [needRankArr[j] integerValue];
            if (needRank_item_v < hadRank_item_v) {//往前移动一位
               [needRankArr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
            NSLog(@"位置%d遍历，位置%d与位置%d",i,j,j+1);
        }
    }
    NSLog(@"插入排序%@",needRankArr);
}

void SelectionSort (NSMutableArray *needRankArr) {
    
    // 每次遍历都是找到最小的，而且数组不是和相邻的做对比 1-2，1-3，1-4这种
     for (int i=0; i<needRankArr.count-1; i++) {
           for (int j=i+1; j<needRankArr.count; j++) {
               NSInteger m = [needRankArr[i] integerValue];
               NSInteger n = [needRankArr[j] integerValue];
               NSLog(@"第%d遍历，位置%d与位置%d",i,i,j);
               if (m > n) {
                   [needRankArr exchangeObjectAtIndex:i withObjectAtIndex:j];
               }
          }
     }
     NSLog(@"选择排序%@",needRankArr);
    
}

//归并排序
void MergeSort1 (NSMutableArray *array, int leftIndex, int midIndex, int rightIndex ) {
    // rightIndex-leftIndex+1的空间
    // 开辟新的空间
    NSMutableArray *aux = [NSMutableArray arrayWithCapacity:rightIndex-leftIndex+1];
    
    //取出原数组中的每个元素 给临时数组
    for (int i=leftIndex; i<= rightIndex; i++) {
         aux[i-leftIndex] = array[i];
    }
    
    //左右两个部分类似于两个竞争队列
    
    //i左半部分索引位置，j右半部分开始索引位置mid+1
    int i = leftIndex, j = midIndex + 1;
    for (int k=i; k<=rightIndex; k++) {
        if (i > midIndex) { //如果左半部分元素已经全部处理完毕--直接开始右边的赋值 不需要做对比
            array[k] = aux[j-leftIndex];
            j++;
        }else if (j > rightIndex) {//如果右半部分元素已经全部处理完毕 开始左边的赋值 不需要做对比
            array[k] = aux[i-leftIndex];
            i++;
        }else if ([aux[i-leftIndex] intValue] < [aux[j-leftIndex] intValue]) {//左右队列做对比 引索移动
            //左半部分所指元素 < 右半部分所指元素
            array[k] = aux[i-leftIndex];
            i++;
        }else {
            array[k] = aux[j-leftIndex];
            j++;
        }
    }
    
}

void MergeSort (NSMutableArray *needRankArr, int leftIndex, int rightIndex) {
    //使用的就是分治思想
    //先对数组做拆分
    if (leftIndex >= rightIndex) return;//
    int mid = (leftIndex + rightIndex)/2;
    //利用递归或者说DFS
    MergeSort(needRankArr, leftIndex, mid);
    MergeSort(needRankArr, mid+1 , rightIndex);
    NSLog(@"l=%d,m=%d,r=%d",leftIndex,mid,rightIndex);
    //会多次调用合并
    MergeSort1(needRankArr, leftIndex, mid, rightIndex);

}


//快速排序
void Quicksort (NSMutableArray *needRankArr) {
    
   
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        NSMutableArray *rankArr = [[NSMutableArray alloc]initWithObjects:@(3),@(7),@(5),@(2),@(9),@(10),@(2),@(11),@(8), nil];
        
        //几种递归排序：
        //冒泡排序：时间复杂度 O(n^2)  空间复杂度O(1)
       // bubbleSort([rankArr mutableCopy]);
        
        //插入排序:时间复杂度 O(n^2)
        /*
         我们将数组中的数据分为两个区间，已排序区间和未排序区间。初始已排序区间只有一个元素，就是数组的第一个元素。插入算法的核心思想是取未排序区间中的元素，在已排序区间中找到合适的插入位置将其插入，并保证已排序区间数据一直有序。重复这个过程，直到未排序区间中元素为空，算法结束。
         */
       //InsertionSort([rankArr mutableCopy]);
        
        
        //选择排序:时间复杂度 O(n^2-)最好最差情况都是  非稳定排序  不建议使用
       // SelectionSort([rankArr mutableCopy])
        
        
        //归并排序 时间复杂度始终是O(nlogn) 缺点：归并排序不是原地排序算法 空间复杂度O(n)
       // MergeSort(rankArr, 0, (int)rankArr.count-1);
        
        
        //快速排序 时间复杂度O(nlogn) 最差O(n^2) 最好O(n) 非稳定排序算法 可以原地排序
        //和归并排序很像，归并自下而上排序，快排自上而下。
        //快排：取分区点然后分区 把小于分区点的放左边 大于分区点放右边 然后继续分区 直到不能分区为止
        //Quicksort
    
        
        NSLog(@"%@",rankArr);
        
    }
    return 0;
}

