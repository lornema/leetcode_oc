//
//  main.m
//  字符串相乘
//
//  Created by lorne on 2020/8/13.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>


NSString* Solution_1(NSString *num1, NSString *num2) {
   
    if ([num1 isEqualToString:@"0"]||[num1 isEqualToString:@"0"]) {
      return @"0";
    }
    
    int m = (int)num1.length;
    int n = (int)num2.length;
    
    NSMutableString *currentString = [[NSMutableString alloc]initWithString:@"0"];
    
    for (int i=0; i<m; i++) {
        
        //获得单个数乘以另一个完整数的得到的字符串
        NSMutableString *productStr = [[NSMutableString alloc]init];//
        NSString *m_str = [num1 substringWithRange:NSMakeRange(m-i-1, 1)];
        int tmp_mn_sum = 0;
        
        
        for (int j = i; j > 0; j--) {//结果补充
          [productStr appendString:@"0"];
        }
        

        for (int j=0; j<n; j++) {
            NSString *n_str = [num2 substringWithRange:NSMakeRange(n-j-1, 1)];
            int mn_product = m_str.intValue * n_str.intValue + tmp_mn_sum;
            int value = mn_product%10;
            tmp_mn_sum =  mn_product/10;
            [productStr appendString:[NSString stringWithFormat:@"%d",value]];
        }
        
        if (tmp_mn_sum != 0) {
           [productStr appendString:[NSString stringWithFormat:@"%d",tmp_mn_sum]];
        }
        
        //当前字符串和上一个字符串相加的到新的字符串
        int k = 0;//(int)currentString.length-1;
        int x = 0;//(int)productStr.length-1;
        int tmp_kx_sum = 0;
        
        if ([currentString isEqualTo:@"0"]) {
            currentString = [productStr  mutableCopy];
        }else{
            
            NSMutableString *tmp_currentString = [[NSMutableString alloc]init];
             while (k < currentString.length || x < productStr.length || tmp_kx_sum!=0) {
                 int k_str = 0;
                 if (k < currentString.length) {
                     k_str = [[currentString substringWithRange:NSMakeRange(k, 1)] intValue];
                 }
                 
                 int x_str = 0;
                 if (x < productStr.length) {
                    x_str = [[productStr substringWithRange:NSMakeRange(x, 1)] intValue];
                 }
                 
                 int sum = k_str + x_str + tmp_kx_sum;
                 int value =  sum%10;
                 tmp_kx_sum = sum/10;
                 [tmp_currentString appendString:[NSString stringWithFormat:@"%d",value]];
                 k++;
                 x++;
             }
             currentString = [tmp_currentString mutableCopy];
        }
    }
    
    //做下反叙 由于oc没有api直接反序 这里偷个懒不写了
    
    return currentString;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
         示例 1:
         输入: num1 = "2", num2 = "3"
         输出: "6"
         示例 2:
         输入: num1 = "123", num2 = "456"
         输出: "56088"
         说明：
         num1 和 num2 的长度小于110。
         num1 和 num2 只包含数字 0-9。
         num1 和 num2 均不以零开头，除非是数字 0 本身。
         不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
         */
        
         //思路1用一个数的每个数乘以另一个整数得到值，然后做累加 得到最终值
        NSLog(@"%@", Solution_1(@"1234", @"4567"));
        // 5635678---8765365
        
        //思路2 如果使用数组代替字符串存储结果，则可以减少对字符串的操作 时间复杂度会降低---不想写了
        
        
    }
    return 0;
}
