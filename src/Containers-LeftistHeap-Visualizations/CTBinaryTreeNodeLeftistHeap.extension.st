Extension { #name : #CTBinaryTreeNodeLeftistHeap }

{ #category : #'*Containers-LeftistHeap-Visualizations' }
CTBinaryTreeNodeLeftistHeap >> instVarsNamesOrderedCollection [
	^ { 
		  #previousLink asReflexiveAssociation.
		  #value asReflexiveAssociation.
		  #rank asReflexiveAssociation.
		  #nextLink asReflexiveAssociation }
]
