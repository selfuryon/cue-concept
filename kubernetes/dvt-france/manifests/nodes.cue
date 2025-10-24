package manifests

import (
	"github.com/selfuryon/cue-concept/apps/ethereumNode"
	"github.com/selfuryon/cue-concept/apps"
)

ethereum: "dvt-node-01": ethereumNode.#Node
ethereum: "dvt-node-01": config: {
	metadata: {
		name:      "dvt-node-01"
		namespace: "mainnet"
	}

	options: "arg1": 1
	options: "arg2": null
}

manifests: apps.#KubernetesManifests
manifests: global: namespace: {
	mainnet: {}
	hoodi: {}
}

manifests: namespace: {
	mainnet: service: vouch: {}
	hoodi: service: vouch: {}
}

manifests: ethereum."dvt-node-01".manifests
