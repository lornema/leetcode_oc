//
//  main.m
//  被围绕的区域
//
//  Created by lorne on 2020/8/11.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>

void DFS(NSMutableArray <NSMutableArray *>*mutableArr, int x, int y) {
    //然后对标记为A的节点开始DFS，将X改成O
    if (x<0||x>=mutableArr[0].count||y<0||y>=mutableArr.count) {
        return; //超出范围
    }
     NSMutableArray *rowArr = mutableArr[y];
     NSString *str_item = rowArr[x];
    if ([str_item isEqualToString:@"O"]) {//
        str_item = @"A";
    }else{
        return;
    }
    [rowArr replaceObjectAtIndex:x withObject:str_item];
    
    DFS(mutableArr, x-1, y);
    DFS(mutableArr, x+1, y);
    DFS(mutableArr, x, y+1);
    DFS(mutableArr, x, y-1);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
       /*给定一个二维的矩阵，包含 'X' 和 'O'（字母 O）。
         找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。
         示例:
          X X X X
          X O O X
          X X O X
          X O X X
         运行你的函数后，矩阵变为：
         X X X X
         X X X X
         X X X X
         X O X X
        解释:
        被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O' 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是“相连”的。
        */
    
        NSArray *  array = @[
                             @[@"X",@"X",@"X",@"X"],
                             @[@"X",@"O",@"O",@"X"],
                             @[@"X",@"X",@"O",@"X"],
                             @[@"X",@"O",@"X",@"X"]
                            ];
        
        //字符串值改变是copy类型 所以把array变成子对象是可变数组的可变数组非常有必要
        NSMutableArray *mutabArray = [[NSMutableArray alloc]init];
        for (int i=0; i<array.count; i++) {
            NSMutableArray *rowArr = [array[i] mutableCopy];
            [mutabArray addObject:rowArr];
        }
    
        for (int i=0; i<mutabArray.count; i++) {

            NSArray *rowArr = mutabArray[i];
            
            if (i==0||i==array.count-1) {
                for (int j=0; j<rowArr.count; j++) {
                    NSString *str_item = rowArr[j];
                    if ([str_item isEqualToString:@"O"]) {
                        DFS(mutabArray, j, i);
                    }
                }
            }else{
                NSString *str_item_0 = rowArr[0];
                if ([str_item_0 isEqualToString:@"O"]) {
                      DFS(mutabArray, 0, i);
                }

                NSString *str_item_last = rowArr[rowArr.count-1];
                if ([str_item_last isEqualToString:@"O"]) {
                     DFS(mutabArray, (int)rowArr.count-1, i);
                }
            }
        }
        
        //遍历一遍将A替换成O，O替换成X
        for (int y=0; y<mutabArray.count; y++) {
            NSMutableArray *rowArr = mutabArray[y];
            for (int x=0; x<rowArr.count; x++) {
                NSString *str_item = rowArr[x];
                if ([str_item isEqualToString:@"O"]) {
                    str_item = @"X";
                }else if([str_item isEqualToString:@"A"]) {
                    str_item = @"O";
                }
                [rowArr replaceObjectAtIndex:x withObject:str_item];
            }
        }
        
        //深度遍历结束
        NSLog(@"%@",mutabArray);
        
     
    }
    return 0;
}
