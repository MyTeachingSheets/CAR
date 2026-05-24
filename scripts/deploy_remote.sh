#!/usr/bin/env bash
set -euo pipefail

PI_HOST="${1:-creative@robotpi.local}"
REPO_DIR="${2:-/home/creative/CAR}"
BRANCH="${3:-main}"

echo "[deploy_remote] host: $PI_HOST  repo: $REPO_DIR  branch: $BRANCH"
ssh "$PI_HOST" "bash -lc '$REPO_DIR/scripts/deploy_pi.sh $REPO_DIR $BRANCH'"
