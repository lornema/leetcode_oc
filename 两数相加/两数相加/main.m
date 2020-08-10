//
//  main.m
//  两数相加
//
//  Created by lorne on 2020/8/10.
//  Copyright © 2020 lorne. All rights reserved.
//

#import <Foundation/Foundation.h>

//单向链表节点
@interface _LinkNode : NSObject {
   @package
    _LinkNode *_next;//__unsafe_unretained 这里不用加上这个参数，会被释放导致链表数据错乱
    NSInteger _value;
}
@end
@implementation _LinkNode
- (instancetype)init
{
    self = [super init];
    if (self) {
        _next = nil;
        _value = 0;
    }
    return self;
}
@end

//单向链表
@interface _LinkNodeMap : NSObject {
    @package
    _LinkNode *_head;//头节点
    _LinkNode *_tail;//尾节点
}
-(void)addValueAtTail:(NSInteger)value;
@end
@implementation _LinkNodeMap
-(void)addValueAtTail:(NSInteger)value{
    _LinkNode *node = [[_LinkNode alloc]init];
    node -> _value = value;
    node -> _next = nil;
    if (!_head) {//第一个
       _head = _tail = node;
    }else{
        if (_head->_next == nil) {
            _head->_next = node;
            _tail = node;
        }else{
            _tail->_next = node;
            _tail = node;
        }
    }
}
@end

//2🌟
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       /*
        给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
        如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
        您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
        示例：
        输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
        输出：7 -> 0 -> 8
        原因：342 + 465 = 807
        */
        
        _LinkNodeMap *mapA = [[_LinkNodeMap alloc]init];
        [mapA addValueAtTail:2];
        [mapA addValueAtTail:4];
        [mapA addValueAtTail:3];
        
        _LinkNodeMap *mapB = [[_LinkNodeMap alloc]init];
        [mapB addValueAtTail:5];
        [mapB addValueAtTail:6];
        [mapB addValueAtTail:4];
       
        _LinkNodeMap *mapOut = [[_LinkNodeMap alloc]init];
        
        BOOL _goNext = YES;
        
       _LinkNode *_LinkNode_tmp_a = mapA -> _head;
       _LinkNode *_LinkNode_tmp_b = mapB -> _head;
        
      NSInteger mapOutLink_next_value_tmp = 0;//mapOut下一个链表接暂存的值

        while (_goNext) {
            //计算两个节点的值
           NSInteger a = 0;
           NSInteger b = 0;
           if (_LinkNode_tmp_a) {
              a = _LinkNode_tmp_a -> _value;
           }

           if (_LinkNode_tmp_b) {
              b = _LinkNode_tmp_b -> _value;
           }

           NSInteger sum = a + b + mapOutLink_next_value_tmp;
           NSInteger next_v = sum/10;
           NSInteger current = sum%10;

           if (next_v > 0) {
               mapOutLink_next_value_tmp = next_v;
           }else{
               mapOutLink_next_value_tmp = 0;
           }

           [mapOut addValueAtTail:current];

           //往后移动一位
            if (_LinkNode_tmp_a) {
              _LinkNode_tmp_a = _LinkNode_tmp_a -> _next;
            }

            if (_LinkNode_tmp_b) {
                _LinkNode_tmp_b = _LinkNode_tmp_b -> _next;
            }

           if (_LinkNode_tmp_a==nil&&_LinkNode_tmp_b==nil&&mapOutLink_next_value_tmp==0) {//全部处理完了
               _goNext = NO;
           }

        }

        //输出
        _LinkNode *_LinkNode_tmp_c = mapOut->_head;
        while  (_LinkNode_tmp_c) {
            NSLog(@"%ld",_LinkNode_tmp_c->_value);
            _LinkNode_tmp_c = _LinkNode_tmp_c->_next;
        }

    }
    return 0;
}
