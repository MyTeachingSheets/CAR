#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${1:-$HOME/CAR}"
BRANCH="${2:-main}"

echo "[deploy_pi] repo: $REPO_DIR  branch: $BRANCH"
cd "$REPO_DIR"

git fetch origin "$BRANCH"
git checkout "$BRANCH"
git pull --ff-only origin "$BRANCH"

echo "[deploy_pi] restarting services..."
sudo systemctl restart rplidar.service foxglove-bridge.service

echo "[deploy_pi] service status:"
systemctl is-active rplidar.service foxglove-bridge.service

echo "[deploy_pi] done"
