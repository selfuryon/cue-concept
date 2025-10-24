package lib

import (
	corev1 "cue.dev/x/k8s.io/api/core/v1"
)

#ServiceConfig: {
	metadata: #Metadata
	selector: [string]: string
	ports: [ID=string]: corev1.#ServicePort & {name: ID}
}

#Service: corev1.#Service & {
	#config: #ServiceConfig

	apiVersion: "v1"
	kind:       "Service"
	metadata:   #config.metadata

	spec: {
		selector: #config.selector
		ports: [for p in #config.ports {p}]
	}
}
