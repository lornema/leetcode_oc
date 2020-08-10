//
//  main.m
//  计数二进制子串
//
//  Created by lorne on 2020/8/10.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>
//1🌟
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //给定一个字符串 s，计算具有相同数量0和1的非空(连续)子字符串的数量，并且这些子字符串中的所有0和所有1都是组合在一起的。
        //重复出现的子串要计算它们出现的次数。
        //示例 1 :
        /*
         输入: "00110011"
        输出: 6
        解释: 有6个子串具有相同数量的连续1和0：“0011”，“01”，“1100”，“10”，“0011” 和 “01”。
             请注意，一些重复出现的子串要计算它们出现的次数。
             另外，“00110011”不是有效的子串，因为所有的0（和1）没有组合在一起。
         */
        //示例 2 :
        /*
         输入: "10101"
         输出: 4
         解释: 有4个子串：“10”，“01”，“10”，“01”，它们具有相同数量的连续1和0。
         */
         NSString *string = @"00110011";
         NSMutableArray *subArr = [[NSMutableArray alloc]init];
        
        for (int i=0; i<string.length-1; i++) {//字符串从0到倒数第二个，最后一个只有一个数不存在相同数量的0或者1
            
            NSMutableString *subStr = [[NSMutableString alloc]init];
            //子字符串中0和1的数量
            int num_0 = 0;
            int num_1 = 0;
                        
            BOOL hadChange = NO;//0->1或者1->0 转换标记
       
            for (int j=i; j<string.length; j++) {
                
                NSString *lastSring = nil;
                NSString *singleStr = [string substringWithRange:NSMakeRange(j, 1)];
                
                if (!lastSring) {
                    lastSring =  singleStr;
                }
                
                //判断当前的字符串
                if ([singleStr isEqualToString:@"0"]) {
                    num_0++;
                }else{
                    num_1++;
                }
                
                if (![lastSring isEqualToString:singleStr]) {
                    if (hadChange) {//已经是0->1 或者 1->0转换过了直接跳出遍历
                        if (num_0 == num_1) {
                             [subArr addObject:subStr];
                        }
                        break;
                    }else{
                        //字符串拼接
                        [subStr appendString:singleStr];
                        hadChange = YES;//设置标记然后继续
                    }
                }else{//相同和上一个是相同的字符串
                    //字符串拼接
                    [subStr appendString:singleStr];
                    if (num_1 == num_0) {//找到了对应字符串 跳出遍历
                        [subArr addObject:subStr];
                        break;
                    }
                    
                }
            }
        }
        
        NSLog(@"%@",subArr);

    }
    return 0;
}
