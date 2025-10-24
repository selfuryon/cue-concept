package lib

import (
	appsv1 "cue.dev/x/k8s.io/api/apps/v1"
)

#StatefulSetConfig: {
	metadata: #Metadata

	selector: [string]: string
	replicas: *1 | uint
	pod:      #PodConfig
}

#StatefulSet: appsv1.#StatefulSet & {
	#config:   #StatefulSetConfig
	#template: #config.pod

	apiVersion: "apps/v1"
	kind:       "Statefulset"
	metadata:   #config.metadata

	spec: {
		serviceName: metadata.name
		selector: matchLabels: #config.selector
		replicas: #config.replicas
		template: #Pod & {#config: #template}
	}
}
