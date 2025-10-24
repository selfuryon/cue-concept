package ethereum

import (
	"encoding/yaml"
	"tool/cli"

	"github.com/selfuryon/cue-concept/clusters"
)

cluster: string @tag(cluster)

objects: [
	for resource in clusters.Clusters[cluster]
	for objects in resource.output
	for object in objects {object},
]

command: dump: print: cli.Print & {
	text: yaml.MarshalStream(objects)
}
