"
I am a node of a `CTLeftistHeap`.

When merged with another node, the lesser of the two values becomes the root, and the other node is merged with the right subtree of that root. Of the two subtrees of the result, the one with the greater rank goes to the left.

My instance variable `rank` is one more than the rank of my right subtree.
"
Class {
	#name : #CTBinaryTreeNodeLeftistHeap,
	#superclass : #CTBinaryTreeNode,
	#instVars : [
		'rank'
	],
	#category : #'Containers-LeftistHeap'
}

{ #category : #actions }
CTBinaryTreeNodeLeftistHeap >> insert: aValue left: leftHeap right: rightHeap inBinaryTree: aBinaryTree [
	| v w t |
	v := leftHeap rank.
	w := rightHeap rank.
	(aBinaryTree is: v lessThan: w)
		ifTrue: [ 
			t := aBinaryTree
				     leftBinaryTreeElement: rightHeap
				     value: aValue
				     rightBinaryTreeElement: leftHeap.
			t rank: v + 1 ]
		ifFalse: [ 
			t := aBinaryTree
				     leftBinaryTreeElement: leftHeap
				     value: aValue
				     rightBinaryTreeElement: rightHeap.
			t rank: w + 1 ].
	^ t
]

{ #category : #actions }
CTBinaryTreeNodeLeftistHeap >> mergeBinaryTreeElement: aBTElement inBinaryTree: aBinaryTree [
	^ aBTElement ifEmpty: [ self ] ifNotEmpty: [ 
		  | y |
		  y := aBTElement value.
		  ((aBinaryTree is: value lessThan: y) or: [ 
			   aBinaryTree is: value equalTo: y ])
			  ifTrue: [ 
				  | r |
				  r := nextLink
					       mergeBinaryTreeElement: aBTElement
					       inBinaryTree: aBinaryTree.
				  self
					  insert: value
					  left: previousLink
					  right: r
					  inBinaryTree: aBinaryTree ]
			  ifFalse: [ 
				  | r |
				  r := self
					       mergeBinaryTreeElement: aBTElement nextLink
					       inBinaryTree: aBinaryTree.
				  self
					  insert: y
					  left: aBTElement previousLink
					  right: r
					  inBinaryTree: aBinaryTree ] ]
]

{ #category : #accessing }
CTBinaryTreeNodeLeftistHeap >> rank [
	^ rank
]

{ #category : #accessing }
CTBinaryTreeNodeLeftistHeap >> rank: anObject [
	rank := anObject
]
