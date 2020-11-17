Class {
	#name : #CTBinaryTreeNodeLeftistHeap,
	#superclass : #CTBinaryTreeNode,
	#instVars : [
		'rank'
	],
	#category : #'Containers-LeftistHeap'
}

{ #category : #creating }
CTBinaryTreeNodeLeftistHeap class >> leaf: anObject [
	^ self
		  left: CTBinaryTreeEmptyLeftistHeap new
		  value: anObject
		  rank: 1
		  right: CTBinaryTreeEmptyLeftistHeap new
]

{ #category : #creating }
CTBinaryTreeNodeLeftistHeap class >> left: leftHeap value: aValue rank: rank right: rightHeap [
	^ (self left: leftHeap value: aValue right: rightHeap)
		  rank: rank;
		  yourself
]

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
