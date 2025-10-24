package dvtFrance

import (
	// "github.com/selfuryon/cue-concept/apps/ethereumNode"
	"github.com/selfuryon/cue-concept/apps"
)

// Resources: "dvt-node-01": ethereumNode.#Node
// Resources: "dvt-node-01": config: {
// 	metadata: {
// 		name:      "dvt-node-01"
// 		namespace: "mainnet"
// 	}

// 	options: "arg1": 1
// 	options: "arg2": null
// }

Manifests: apps.#Manifests
Manifests: global: namespace: {
	mainnet: {}
	hoodi: {}
}

Manifests: namespace: {
	mainnet: service: vouch: {}
	hoodi: service: vouch: {}
}

// Manifests: namespace: mainnet: Resources."dvt-node-01".output
