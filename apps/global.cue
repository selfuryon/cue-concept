package apps

import (
	"strings"
	apps_v1 "cue.dev/x/k8s.io/api/apps/v1"
	core_v1 "cue.dev/x/k8s.io/api/core/v1"

)

// Kubernetes Types: Global Scoped
#GlobalKubernetesTypes: [TYPE=string]: [ID=string]: {
	apiVersion: *"v1" | string
	kind:       *strings.ToTitle(TYPE) | string
	metadata: name: *ID | string
}

#GlobalKubernetesTypes: {
	namespace: [string]: core_v1.#Namespace
}

// Kubernetes Types: Namespace Scoped
#NSKubernetesTypes: [TYPE=string]: [ID=string]: {
	apiVersion: *"v1" | string
	kind:       *strings.ToTitle(TYPE) | string
	metadata: name: *ID | string
}

#NSKubernetesTypes: {
	serviceAccount: [string]: core_v1.#ServiceAccount
	statefulSet: [string]:    apps_v1.#StatefulSet
	service: [string]:        core_v1.#Service
}

#KubernetesManifests: global: #GlobalKubernetesTypes

#KubernetesManifests: scoped: [string]: #NSKubernetesTypes
#KubernetesManifests: scoped: [ns=string]: [type=string]: [name=string]: {
	metadata: namespace: ns
}
