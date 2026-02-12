#!/usr/bin/env bash
set -euo pipefail
source s3-secure-bucket-baseline/cli-commands/01-variables.sh

aws sts get-caller-identity | tee "$EVIDENCE_DIR/01-sts.json"
