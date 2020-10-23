//
//  main.m
//  二叉树中的最大路径和
//
//  Created by lorne on 2020/10/19.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
            
        /*
         给定一个非空二叉树，返回其最大路径和。
         本题中，路径被定义为一条从树中任意节点出发，沿父节点-子节点连接，达到任意节点的序列。该路径至少包含一个节点，且不一定经过根节点。
         eg1:
         输入: [1, 2, 3]
              1
             / \
            2   3
         输出：6
         
         eg2:
         输入: [-10, 9, 20, null, null, 15, 7]
          -10
          / \
         9   20
            /  \
           15   7
         输出：42
         */
        
        //解：利用递归思想，实现一个maxGain（node）函数，该函数计算二叉树中的一个节点的最大贡献值（以该节点为根节点的子树中寻找以该节点为起点的一条路径，使得该路径上的节点值之和最大；比如：9、15、7节点最大贡献值就是9、15、7，20节点最大贡献值是20+15=35，-10节点最大贡献值是：19）
        //下面放一个c++的解法 oc的后续补充
        /*
         class Solution {
         private:
             int maxSum = INT_MIN;

         public:
             int maxGain(TreeNode* node) {
                 if (node == nullptr) {
                     return 0;
                 }
                 
                 // 递归计算左右子节点的最大贡献值
                 // 只有在最大贡献值大于 0 时，才会选取对应子节点
                 int leftGain = max(maxGain(node->left), 0);
                 int rightGain = max(maxGain(node->right), 0);

                 // 节点的最大路径和取决于该节点的值与该节点的左右子节点的最大贡献值
                 int priceNewpath = node->val + leftGain + rightGain;

                 // 更新答案
                 maxSum = max(maxSum, priceNewpath);

                 // 返回节点的最大贡献值
                 return node->val + max(leftGain, rightGain);
             }

             int maxPathSum(TreeNode* root) {
                 maxGain(root);
                 return maxSum;
             }
         };
         */
        
      
        
        
        
    }
    return 0;
}
