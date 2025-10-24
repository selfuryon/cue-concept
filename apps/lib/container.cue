package lib

import (
	corev1 "cue.dev/x/k8s.io/api/core/v1"
)

#ContainerConfig: {
	name: string

	image:   string
	version: string

	subCommand: [...string]
	options: [...string]

	env: [string]: corev1.#EnvVar
}

#Container: corev1.#Container & {
	#config: #ContainerConfig

	name: #config.name

	image: "\(#config.image):\(#config.version)"

	command: #config.subCommand
	args:    #config.options

	env: [for k, v in #config.env {name: k, v}]
}
