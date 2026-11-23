"
I am a leftist heap: a binary tree whose root is its least element. The order is that of `is:lessThan:` and `is:equalTo:`.

```smalltalk
| heap |
heap := #( 5 3 8 1 ) asLeftistHeap.
heap push: 2.
{ heap root. heap pop. heap pop. heap pop. heap isEmpty } ""#(1 1 2 3 false)""
```

My elements are `CTBinaryTreeNodeLeftistHeap` and `CTBinaryTreeEmptyLeftistHeap`: the merge of nodes keeps the order, and their ranks decide which subtree goes to the left.
"
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
