package clusters

import (
	"github.com/selfuryon/cue-concept/clusters/dvt-france:dvtFrance"
	"github.com/selfuryon/cue-concept/apps"
)

Clusters: [string]:     apps.#Manifests
Clusters: "dvt-france": dvtFrance.Manifests
