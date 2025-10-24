package ethereumNode

import (
	"list"
	"github.com/selfuryon/cue-concept/apps/lib"
)

#NodeConfig: {
	metadata: lib.#Metadata

	options: [string]: null | string | int | bool
}

#Node: {
	config: #NodeConfig
	manifests: {
		statefulSet: [string]: lib.#StatefulSet
		statefulSet: (config.metadata.name): {
			#config: {
				metadata: config.metadata

				selector: metadata.labels
				pod: {
					metadata: config.metadata
					containers: "node": {
						#config: {
							image:   "alpine"
							version: "3.21"

							command: ["ls"]
							options: list.Concat([
								[for k, v in config.options if v == null {"\(k)"}],
								[for k, v in config.options if v != null {"\(k)=\(v)"}],
							])
						}
					}
				}
			}
		}
		service: [string]: lib.#Service
		service: (config.metadata.name): {
			#config: {
				metadata: config.metadata

				selector: metadata.labels
				ports: "http": {
					port: 1234
				}
			}
		}
	}
}
