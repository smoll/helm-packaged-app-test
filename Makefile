default: local

local:
	kubectl config use-context docker-for-desktop

# Deploys Dockerfile (code) + Helm (config)
skaffold:
	skaffold run -v debug

# Deploys Helm (config) only
deploy:
	helm upgrade --install --namespace tinyapp --values ./config/helm/local-values.yaml "tinyapp" ./charts/tinyapp

# Shows Helm (config) diff
diff:
	# helm plugin install https://github.com/databus23/helm-diff --version master
	helm diff upgrade tinyapp ./charts/tinyapp --values ./config/helm/local-values.yaml
