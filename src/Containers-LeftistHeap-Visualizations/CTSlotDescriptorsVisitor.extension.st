Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-LeftistHeap-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTBinaryTreeElementLeftistHeap: aTreeElement [

	^ (self visitCTDoubleValueLink: aTreeElement) asOrderedCollection
		  add: #rank asSlotDescriptor afterIndex: 1;
		  yourself
]
