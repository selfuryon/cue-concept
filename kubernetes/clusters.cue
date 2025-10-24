package clusters

import (
	dvtFrance "github.com/selfuryon/cue-concept/kubernetes/dvt-france/manifests"
	"github.com/selfuryon/cue-concept/apps"
)

Clusters: [string]: apps.#KubernetesManifests

Clusters: "dvt-france": dvtFrance.manifests
