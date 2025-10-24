package ethereum

import (
	"encoding/yaml"
	"tool/cli"
	"list"

	"github.com/selfuryon/cue-concept/kubernetes"
)

cluster: string @tag(cluster)

objects: list.Concat([[
	for objects in kubernetes.Clusters[cluster].global
	for object in objects {object},
], [
	for scope in kubernetes.Clusters[cluster].scoped
	for objects in scope for object in objects {object},
]])

command: dump: print: cli.Print & {
	text: yaml.MarshalStream(objects)
}
