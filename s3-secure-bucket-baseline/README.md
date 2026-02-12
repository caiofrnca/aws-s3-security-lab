### S3 Secure Bucket Baseline

This build is part of my AWS Solutions Architect Associate (SAA-C03) "build-as-I-learn" path:

#### Goal:
Deploy an Amazon S3 bucket with a secure-by-default baseline using CLI only:
- Prevent public exposure
- Enforce encryption at rest
- Enforce HTTPS-only access
- Enable versioning for recovery patterns
- Capture evidence for repeatability

### Controls Implemented
##### 1 - Block Public Access
Bucket-level Block Public Access is enabled to prevent accidental public ACLs or public policies.

##### 2 - Default encryption (SSE-S3)
Bucket default encryption is configured to **SSE-S3 (AES256)**.

##### 3 - Bucket policy guardrails
A bucket policy enforces:
- **Deny** any non-HTTPS requests (`aws:SecureTransport=false`)
- **Deny** uploads missing the SSE header
- **Deny** incorrect encryption headers (forces `AES256`)

##### 4 - Versioning
Versioning is enabled to support rollback and recovery from accidental overwrites. This is widely used!

### Execution approach
>  See `docs/design-decisions.md`.
> For this lab, AWS CLI commands are grouped into `.sh` files to make the build
> process explicit and repeatable.

Scripts are under:
- `cli-commands/`

1. Edit `cli-commands/01-variables.sh` and set `BUCKET` to a globally unique name.
2. Run scripts in order:
```bash
./cli-commands/02-whoami.sh
./cli-commands/03-create-bucket.sh
./cli-commands/04-public-access-block.sh
./cli-commands/05-enable-versioning.sh
./cli-commands/06-default-encryption-sse-s3.sh
./cli-commands/07-apply-bucket-policy.sh
./cli-commands/08-tests.sh
./cli-commands/99-verify.sh
```

### Notes
S3 is a common exam and real-world risk area due to misconfiguration.
This build reinforces shared responsibility, defense-in-depth, and baseline guardrails.
