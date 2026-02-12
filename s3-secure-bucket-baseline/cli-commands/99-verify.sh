#!/usr/bin/env bash
set -euo pipefail
source s3-secure-bucket-baseline/cli-commands/01-variables.sh

aws s3api get-bucket-location --bucket "$BUCKET" | tee "$EVIDENCE_DIR/99-location.json"
aws s3api get-public-access-block --bucket "$BUCKET" | tee "$EVIDENCE_DIR/99-public-access.json"
aws s3api get-bucket-versioning --bucket "$BUCKET" | tee "$EVIDENCE_DIR/99-versioning.json"
aws s3api get-bucket-encryption --bucket "$BUCKET" | tee "$EVIDENCE_DIR/99-encryption.json"
aws s3api get-bucket-policy --bucket "$BUCKET" | tee "$EVIDENCE_DIR/99-policy.json"
