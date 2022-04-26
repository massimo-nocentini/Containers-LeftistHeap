Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-LeftistHeap-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTBinaryTreeElementLeftistHeap: aTreeElement [

	| descriptors |
	descriptors := (self visitCTDoubleValueLink: aTreeElement)
		               asOrderedCollection.

	descriptors
		add: (self newSlotDescriptor
				 selector: #rank;
				 yourself)
		afterIndex: 1.

	^ descriptors
]
