#!/usr/bin/env bash
set -euo pipefail
source s3-secure-bucket-baseline/cli-commands/01-variables.sh

TEST_FILE="/tmp/hello-s3.txt"
echo "hello secure s3 $(date -u +%Y-%m-%dT%H:%M:%SZ)" > "$TEST_FILE"

# SUCCESS (with encryption header)
aws s3api put-object \
  --bucket "$BUCKET" \
  --key "test/hello.txt" \
  --body "$TEST_FILE" \
  --server-side-encryption AES256 \
  | tee "$EVIDENCE_DIR/07-put-object-success.json"

aws s3api head-object \
  --bucket "$BUCKET" \
  --key "test/hello.txt" \
  | tee "$EVIDENCE_DIR/08-head-object.json"

# EXPECTED FAIL (missing encryption header)
set +e
aws s3api put-object \
  --bucket "$BUCKET" \
  --key "test/should-fail.txt" \
  --body "$TEST_FILE" \
  2>&1 | tee "$EVIDENCE_DIR/09-put-object-denied.txt"
set -e
