#import <Foundation/Foundation.h>
/**
 A full binary tree is a binary tree where each node has exactly 0 or 2 children.

 Return a list of all possible full binary trees with N nodes.
 Each node of each tree in the answer must have its value set to 0.
 You may return the final list of trees in any order.

 Example:
 Input: 7
 Output:
  [
  [0,0,0,null,null,0,0,null,null,0,0],
  [0,0,0,null,null,0,0,0,0],
  [0,0,0,0,0,0,0],
  [0,0,0,0,0,null,null,null,null,0,0],
  [0,0,0,0,0,null,null,0,0]
  ]

 For a visual explanation on the output have a look at ExampleTrees.png
 The order of images vs output lines is from left to right, from top to bottom.
 Note: trailing null nodes are omitted from the output.
 */
@interface FullBinaryTrees : NSObject
- (NSString *)stringForNodeCount:(NSInteger)count;
@end
