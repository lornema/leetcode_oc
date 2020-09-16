//
//  main.m
//  解数独
//
//  Created by lorne on 2020/9/15.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isValid (int i, int j, NSString *v, NSMutableArray *arrM) {//判断是否为可填项目
    
    //同一行比较
    NSArray *arr_i = arrM[i];
    for (int m=0; m<arr_i.count; m++) {
        NSString *str = [NSString stringWithFormat:@"%@",arr_i[m]];
        if ([str isEqualToString:v]) {
            return NO;
        }
    }
    
    //每一行的第j个 比较
    for (int n=0; n<arrM.count; n++) {
        NSString *str = [NSString stringWithFormat:@"%@",arrM[n][j]];
        if ([str isEqualToString:v]) {
           return NO;
        }
    }
    
    //判断第几个子9宫格
    int x = i/3;
    int y = j/3;
    for (int m=x*3; m<x*3+3; m++) {
        for (int n=y*3; n<y*3+3; n++) {
           NSString *str = [NSString stringWithFormat:@"%@",arrM[m][n]];
            if ([str isEqualToString:v]) {
                return NO;
           }
        }
    }
    
    return YES;
}

BOOL backtracking (NSMutableArray *arrM) {
    
    //有优化空间
    for (int i=0; i<arrM.count; i++) {
        NSArray *arr = arrM[i];
        for (int j=0; j<arr.count; j++) {
            NSString *str = arrM[i][j];
            if (![str isEqualToString:@"."]) {
               continue;
            }
            
            for (int k=1; k<=9; k++) {
                NSString *value = [NSString stringWithFormat:@"%d",k];
                if (isValid(i, j, value, arrM)) {//可以填入
                    arrM[i][j] = [NSString stringWithFormat:@"%d",k];
                    if (backtracking(arrM)) {//继续递归
                        return YES;
                    }
                    arrM[i][j] = @".";
                  
                }
            }
            return NO;//终止递归
        }
    }
  
    return YES;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      /*
      编写一个程序，通过已填充的空格来解决数独问题。

      一个数独的解法需遵循如下规则：

      数字 1-9 在每一行只能出现一次。
      数字 1-9 在每一列只能出现一次。
      数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
      空白格用 '.' 表示。
      */
        NSArray *sudokuArr = @[
                              @[@"5",@"3",@".",@".",@"7",@".",@".",@".",@"."],
                              @[@"6",@".",@".",@"1",@"9",@"5",@".",@".",@"."],
                              @[@".",@"9",@"8",@".",@".",@".",@".",@"6",@"."],
                              @[@"8",@".",@".",@".",@"6",@".",@".",@".",@"3"],
                              @[@"4",@".",@".",@"8",@".",@"3",@".",@".",@"1"],
                              @[@"7",@".",@".",@".",@"2",@".",@".",@".",@"6"],
                              @[@".",@"6",@".",@".",@".",@".",@"2",@"8",@"."],
                              @[@".",@".",@".",@"4",@"1",@"9",@".",@".",@"5"],
                              @[@".",@".",@".",@".",@"8",@".",@".",@"7",@"9"],
                              ];
        
        //做一个数据copy
        NSMutableArray *needChangeArr = [[NSMutableArray alloc]init];
        for (int i=0; i<sudokuArr.count; i++) {
            NSMutableArray *rowArr = [sudokuArr[i] mutableCopy];
            [needChangeArr addObject:rowArr];
        }

        //进行回溯算法
        backtracking(needChangeArr);
        
        NSLog(@"%@",needChangeArr);
        /*
         @[@"5",@"3",@"4",@"6",@"7",@"8",@"9",@"1",@"2"],
         @[@"6",@"7",@"2",@"1",@"9",@"5",@"3",@"4",@"8"],
         @[@"1",@"9",@"8",@"3",@"4",@"2",@"5",@"6",@"7"],
         @[@"8",@"5",@"9",@"7",@"6",@"1",@"4",@"2",@"3"],
         @[@"4",@"2",@"6",@"8",@"5",@"3",@"7",@"9",@"1"],
         @[@"7",@"1",@"3",@"9",@"2",@"4",@"8",@"5",@"6"],
         @[@"9",@"6",@"1",@"5",@"3",@"7",@"2",@"8",@"4"],
         @[@"2",@"8",@"7",@"4",@"1",@"9",@"6",@"3",@"5"],
         @[@"3",@"4",@"5",@"2",@"8",@"6",@"1",@"7",@"9"],
         */
    
    }
    return 0;
}
