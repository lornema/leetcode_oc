//
//  main.m
//  稀疏相似度
//
//  Created by lorne on 2020/8/24.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>
//难度：3🌟---感觉很简单。。。这个难度有点水


CGFloat Similarity (NSArray <NSNumber *>*arr1, NSArray <NSNumber *>*arr2) {
    CGFloat similarityV = 0.4f;
    
    //求出交集数
    int same_num = 0;
    for (int i=0; i<arr1.count; i++) {
        NSNumber *item_arr1 = arr1[i];
        for (int j=0; j<arr2.count; j++) {
            NSNumber *item_arr2 = arr2[j];
            if ([item_arr1 intValue]==[item_arr2 intValue]) {
                same_num ++;//有相同的
                break;
            }
         }
    }
    
    //并集数
    int diff_num = (int)arr1.count+(int)arr2.count-same_num;
    
    //因为要精确4位所以利用整数
    int tmp_same_num = same_num *10000;
    int similarity = tmp_same_num/diff_num;
    
    CGFloat similarity_float = (CGFloat)similarity;
    return similarityV;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         两个(具有不同单词的)文档的交集(intersection)中元素的个数除以并集(union)中元素的个数，就是这两个文档的相似度。
         例如，{1, 5, 3} 和 {1, 7, 2, 3} 的相似度是 0.4，其中，交集的元素有 2 个，并集的元素有 5个。
         给定一系列的长篇文档，每个文档元素各不相同，并与一个 ID 相关联。它们的相似度非常“稀疏”，也就是说任选 2个文档，相似度都很接近 0。请设计一个算法返回每对文档的 ID 及其相似度。只需输出相似度大于 0 的组合。请忽略空文档。
         
         为简单起见，可以假定每个文档由一个含有不同整数的数组表示。输入为一个二维数组 docs，docs[i] 表示 id 为 i 的文档。返回一个数组，其中每个元素是一个字符串，代表每对相似度大于 0 的文档，其格式为 {id1},{id2}: {similarity}，其中 id1 为两个文档中较小的 id，similarity 为相似度，精确到小数点后 4 位。以任意顺序返回数组均可。
         示例:

         输入:
         [
           [14, 15, 100, 9, 3],
           [32, 1, 9, 3, 5],
           [15, 29, 2, 6, 8, 7],
           [7, 10]
         ]
         输出:
         [
           "0,1: 0.2500",
           "0,2: 0.1000",
           "2,3: 0.1429"
         ]
         提示：
         docs.length <= 500
         docs[i].length <= 500
         */
        
        //Solution
        NSArray *num = @[@[@(14), @(15), @(100), @(9), @(3)],
                          @[@(32), @(1), @(9), @(3), @(5)],
                          @[@(15), @(29), @(2), @(6), @(8), @(7)],
                          @[@(7), @(10)]];
        
        
        NSMutableArray *arrM = [[NSMutableArray alloc]init];
        for (int i=0; i<num.count; i++) {
            NSArray *arr1 = num[i];
            for (int j=i+1; j<num.count; j++) {
                NSArray *arr2 = num[j];
                CGFloat similarity_value = Similarity(arr1, arr2);
                if (similarity_value>0) {
                    NSString *item_pre = [NSString stringWithFormat:@"%d,%d",i,j];
                    NSString *item_value = [NSString stringWithFormat:@"%.4f",similarity_value];
                    NSString *item = [NSString stringWithFormat:@"%@: %@",item_pre,item_value];
                    [arrM addObject:item];
                }
            }
        }
    
        NSLog(@"%@",arrM);
        
    }
    return 0;
}


