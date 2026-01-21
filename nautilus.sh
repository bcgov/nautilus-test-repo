set -euxo pipefail

echo "Going to deploy the sample app!"

cd charts/nautilus-test-app

helm -n e52f12-dev upgrade --install hackathon-sample-app .

echo "Deployed! develop branch"
