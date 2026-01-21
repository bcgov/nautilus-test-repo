set -euxo pipefail

echo "Going to deploy the sample app!"

cd charts/nautilus-test-app

pwd

oc login --token="${OPENSHIFT_TOKEN}" --server=https://api.silver.devops.gov.bc.ca:6443

oc projects

helm -n e52f12-dev upgrade --install hackathon-sample-app .

echo "Deployed! develop branch"
