#!/usr/bin/env bash
set -euo pipefail
source s3-secure-bucket-baseline/cli-commands/01-variables.sh

set +e
aws s3api create-bucket \
  --bucket "$BUCKET" \
  --region "$AWS_REGION" \
  --create-bucket-configuration LocationConstraint="$AWS_REGION" \
  2>&1 | tee "$EVIDENCE_DIR/02-create-bucket.txt"
set -e

aws s3api head-bucket --bucket "$BUCKET" \
  && echo "Bucket exists and is accessible." | tee "$EVIDENCE_DIR/02-head-bucket.txt"
