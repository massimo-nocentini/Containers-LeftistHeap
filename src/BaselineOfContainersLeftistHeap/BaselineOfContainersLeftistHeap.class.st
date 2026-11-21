Class {
	#name : #BaselineOfContainersLeftistHeap,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersLeftistHeap
}

{ #category : #baselines }
BaselineOfContainersLeftistHeap >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'ContainersEssentials'
			with: [ spec repository: 'github://massimo-nocentini/Containers-Essentials:master' ].

		spec
			baseline: 'ContainersBinaryTreeAbstract'
			with: [ spec repository: 'github://massimo-nocentini/Containers-BinaryTreeAbstract:master/src' ].

		"Packages"
		spec
			package: 'Containers-LeftistHeap'
			with: [ spec requires: #( 'ContainersEssentials' 'ContainersBinaryTreeAbstract' ) ];
			package: 'Containers-LeftistHeap-Visualizations'
			with: [ spec requires: #( 'Containers-LeftistHeap' ) ];
			package: 'Containers-LeftistHeap-Tests'
			with: [ spec requires: #( 'Containers-LeftistHeap' ) ] ]
]
