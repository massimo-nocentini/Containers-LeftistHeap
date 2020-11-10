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
CTBinaryTreeNodeLeftistHeap >> insert: aValue left: leftHeap right: rightHeap [
	| v w |
	v := leftHeap rank.
	w := rightHeap rank.
	^ v < w
		  ifTrue: [ 
			  self class
				  left: rightHeap
				  value: aValue
				  rank: v + 1
				  right: leftHeap ]
		  ifFalse: [ 
			  self class
				  left: leftHeap
				  value: aValue
				  rank: w + 1
				  right: rightHeap ]
]

{ #category : #actions }
CTBinaryTreeNodeLeftistHeap >> mergeBinaryTree: aTree [
	| w |
	w := aTree value.
	^ value <= w
		  ifTrue: [ 
			  self
				  insert: value
				  left: previousLink
				  right: (nextLink mergeBinaryTree: aTree) ]
		  ifFalse: [ 
			  self
				  insert: w
				  left: aTree previousLink
				  right: (aTree nextLink mergeBinaryTree: self) ]
]

{ #category : #removing }
CTBinaryTreeNodeLeftistHeap >> pop [
	^ previousLink merge: nextLink
]

{ #category : #accessing }
CTBinaryTreeNodeLeftistHeap >> rank [
	^ rank
]

{ #category : #accessing }
CTBinaryTreeNodeLeftistHeap >> rank: anObject [
	rank := anObject
]
