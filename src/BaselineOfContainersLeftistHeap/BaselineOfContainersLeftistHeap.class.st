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
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Essentials' ].

		"Packages"
		spec
			package: 'Containers-LeftistHeap';
			package: 'Containers-LeftistHeap-Visualizations';
			package: 'Containers-LeftistHeap-Tests' ]
]
