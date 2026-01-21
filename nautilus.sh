set -euxo pipefail

echo "Going to deploy the sample app!"

cd charts/nautilus-test-app

pwd

oc login --token="${OPENSHIFT_TOKEN}" --server=https://api.silver.devops.gov.bc.ca:6443

oc projects

if helm -n e52f12-dev status hackathon-2026 >/dev/null 2>&1; then
  oc -n e52f12-dev rollout restart deployment hackathon-2026-nautilus-test-app
else
  helm -n e52f12-dev upgrade --install hackathon-2026 .
fi

echo "Deployed! develop branch"
