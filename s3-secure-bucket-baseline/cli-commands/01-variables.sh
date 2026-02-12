#!/usr/bin/env bash
set -euo pipefail

export AWS_REGION="eu-west-1"

# Must be unique(globaly)!!!!
export BUCKET="s3-caiolab-sec1"

export EVIDENCE_DIR="s3-secure-bucket-baseline/evidence/cli"
mkdir -p "$EVIDENCE_DIR"

{
  echo "AWS_REGION=$AWS_REGION"
  echo "BUCKET=$BUCKET"
} | tee "$EVIDENCE_DIR/00-vars.txt"
