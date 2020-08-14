//
//  main.m
//  克隆图
//
//  Created by lorne on 2020/8/12.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChartNode : NSObject
{
    @package
    int _value;
    NSMutableArray <ChartNode *>*_neighbors;
}
@end
@implementation ChartNode
- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = 0;
        _neighbors = [[NSMutableArray alloc]init];
    }
    return self;
}
@end

@interface Solution : NSObject
@property (nonatomic, strong) NSMutableDictionary *dicM;
@property (nonatomic, strong) ChartNode *cloneNode;
@end
@implementation Solution
- (ChartNode *)cloneGraph:(ChartNode *)node{
    
    self.dicM = [[NSMutableDictionary alloc]init];
    return [self DFS:node];
}

- (ChartNode *)DFS:(ChartNode *)node{
    
    NSNumber *key = @(node->_value);
    //有克隆过直接返回
    if ([self.dicM objectForKey:key]) {
        return self.dicM[key];
    }
    self.cloneNode = [[ChartNode alloc]init];
    self.cloneNode -> _value =  node->_value;
    NSMutableArray *neighborArr = node -> _neighbors;
    for (ChartNode *neighbor in neighborArr) {
        [self.cloneNode -> _neighbors addObject:[self DFS:neighbor]];
    }

    return self.cloneNode;
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
     /*
      给你无向 连通 图中一个节点的引用，请你返回该图的 深拷贝（克隆）。
      图中的每个节点都包含它的值 val（int） 和其邻居的列表（list[Node]）。
      class Node {
          public int val;
          public List<Node> neighbors;
      }
      提示：
      节点数不超过 100 。
      每个节点值 Node.val 都是唯一的，1 <= Node.val <= 100。
      无向图是一个简单图，这意味着图中没有重复的边，也没有自环。
      由于图是无向的，如果节点 p 是节点 q 的邻居，那么节点 q 也必须是节点 p 的邻居。
      图是连通图，你可以从给定节点访问到所有节点。
      */
      //这里为了简单起见，每个节点的值都和它的索引相同
     /*eg
      1----2
      |    |
      4----3
      输入：adjList = [[2,4],[1,3],[2,4],[1,3]]
      输出：[[2,4],[1,3],[2,4],[1,3]]
      解释：
      图中有 4 个节点。
      节点 1 的值是 1，它有两个邻居：节点 2 和 4 。
      节点 2 的值是 2，它有两个邻居：节点 1 和 3 。
      节点 3 的值是 3，它有两个邻居：节点 2 和 4 。
      节点 4 的值是 4，它有两个邻居：节点 1 和 3 。
      */
     
      //解答：
      //开始构造一个图结构
       ChartNode *node1 = [[ChartNode alloc]init];
       ChartNode *node2 = [[ChartNode alloc]init];
       ChartNode *node3 = [[ChartNode alloc]init];
       ChartNode *node4 = [[ChartNode alloc]init];
        node1->_value = 1;
        node2->_value = 2;
        node3->_value = 3;
        node3->_value = 4;
        node1->_neighbors = [@[node2,node4] mutableCopy];
        node2->_neighbors = [@[node1,node3] mutableCopy];
        node3->_neighbors = [@[node2,node4] mutableCopy];
        node3->_neighbors = [@[node1,node3] mutableCopy];
        
        
        //利用DFS 便利节点  不过要注意不要陷入无限循环防止重复遍历就行
        Solution *solution = [[Solution alloc]init];
       ChartNode *cloneNode = [solution cloneGraph:node1];
        
        NSLog(@"%@",cloneNode);
       // newNode 为新客隆图的第一个节点

    }
    return 0;
}
