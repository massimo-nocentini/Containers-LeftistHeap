Class {
	#name : #CTLeftistHeap,
	#superclass : #CTBinaryTreeAbstract,
	#category : #'Containers-LeftistHeap'
}

{ #category : #creating }
CTLeftistHeap >> binaryTreeElementEmpty [
	^ CTBinaryTreeEmptyLeftistHeap new
]

{ #category : #creating }
CTLeftistHeap >> binaryTreeElementLeaf: anObject [
	^ (super binaryTreeElementLeaf: anObject)
		  rank: 1;
		  yourself
]

{ #category : #creating }
CTLeftistHeap >> binaryTreeElementNode [
	^ CTBinaryTreeNodeLeftistHeap new
]
