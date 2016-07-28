//
//  RobTestObject.m
//  App
//
//  Created by Robert Stein on 7/26/16.
//
//

#import "RobTestObject.h"

@interface Node : NSObject

- (instancetype)initWithValue:(NSString *)str;
- (void)visit;

@property (nonatomic, copy) NSString *value;
@property (nonatomic, strong) Node *left;
@property (nonatomic, strong) Node *right;

@end

@implementation Node

@synthesize value = _value;
@synthesize left = _left;
@synthesize right = _right;

- (instancetype)initWithValue:(NSString *)str {
	if (self = [super init]) {
		_value = str;
	}
	return self;
}

- (void)visit {
	NSLog([self value]);
}

@end

@implementation RobTestObject

+ (void)doInterviewQuestion { // how about that awesome name?
	Node *tree = [[Node alloc] initWithValue:@"F"];
	tree.left = [[Node alloc] initWithValue:@"B"];
	tree.right = [[Node alloc] initWithValue:@"G"];
	tree.left.left = [[Node alloc] initWithValue:@"A"];
	tree.left.right = [[Node alloc] initWithValue:@"D"];
	tree.right.right = [[Node alloc] initWithValue:@"I"];
	tree.left.right.left = [[Node alloc] initWithValue:@"C"];
	tree.left.right.right = [[Node alloc] initWithValue:@"E"];
	tree.right.right.left = [[Node alloc] initWithValue:@"H"];
	
	[self preOrderTraversal:tree];
	//[self inOrderTraversal:node];
	//[self postOrderTraversal:node];
	//[self levelOrderTraversal:node];
}

+ (void)preOrderTraversal:(Node *)node {
	if (node == nil) {
		return;
	} else {
		[node visit];
		[self preOrderTraversal:node.left];
		[self preOrderTraversal:node.right];
	}
}

@end
