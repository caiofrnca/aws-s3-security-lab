#!/usr/bin/env bash
set -euo pipefail
source s3-secure-bucket-baseline/cli-commands/01-variables.sh

aws s3api put-bucket-versioning \
  --bucket "$BUCKET" \
  --versioning-configuration Status=Enabled

aws s3api get-bucket-versioning --bucket "$BUCKET" \
  | tee "$EVIDENCE_DIR/04-versioning.json"
