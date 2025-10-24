package lib

import (
	corev1 "cue.dev/x/k8s.io/api/core/v1"
)

#PodConfig: {
	metadata: #Metadata

	containers: [string]:     #Container
	initContainers: [string]: #Container
}

#Pod: corev1.#Pod & {
	#config: #PodConfig

	metadata: #config.metadata

	spec: {
		containers: [for k, v in #config.containers {name: k, v}]
		initContainers: [for k, v in #config.initContainers {name: k, v}]
	}
}
