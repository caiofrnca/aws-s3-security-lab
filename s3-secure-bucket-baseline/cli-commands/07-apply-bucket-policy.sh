#!/usr/bin/env bash
set -euo pipefail
source s3-secure-bucket-baseline/cli-commands/01-variables.sh

POLICY_SRC="s3-secure-bucket-baseline/policy/bucket-policy.json"
POLICY_TMP="/tmp/s3-bucket-policy.json"

sed "s/REPLACE_BUCKET/$BUCKET/g" "$POLICY_SRC" > "$POLICY_TMP"

aws s3api put-bucket-policy \
  --bucket "$BUCKET" \
  --policy "file://$POLICY_TMP"

aws s3api get-bucket-policy --bucket "$BUCKET" \
  | tee "$EVIDENCE_DIR/06-bucket-policy.json"
