#!/usr/bin/env bash
set -euo pipefail
source s3-secure-bucket-baseline/cli-commands/01-variables.sh

aws s3api put-bucket-encryption \
  --bucket "$BUCKET" \
  --server-side-encryption-configuration '{
    "Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]
  }'

aws s3api get-bucket-encryption --bucket "$BUCKET" \
  | tee "$EVIDENCE_DIR/05-encryption.json"
