package lib

import (
	appsv1 "cue.dev/x/k8s.io/api/apps/v1"
)

#DeploymentConfig: {
	metadata: #Metadata

	selector: [string]: string
	replicas: *1 | uint
	pod:      #PodConfig
}

#Deployment: appsv1.#Deployment & {
	#config:   #DeploymentConfig
	#template: #config.pod

	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata:   #config.metadata

	spec: {
		selector: matchLabels: #config.selector
		replicas: #config.replicas
		template: #Pod & {#config: #template}
	}
}
