set -euxo pipefail

echo "Going to deploy the sample app!"

cd charts/nautilus-test-app

oc login --token="${OPENSHIFT_TOKEN}" --server=https://api.silver.devops.gov.bc.ca:6443

IMAGE_TAG="${1:-latest}"

helm -n e52f12-dev upgrade --install hackathon-2026 . --set image.tag="${IMAGE_TAG}"
oc -n e52f12-dev rollout restart deployment hackathon-2026-nautilus-test-app

echo "Deployed! develop branch"
