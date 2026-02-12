### S3 Secure Bucket Baseline - Design desicions

#### Concepts covered (S3)
- Bucket: globally unique container for objects
- Object storage: key/value object model
- Access control: IAM + bucket policy + (legacy) ACLs
- Block Public Access: safety guardrail against accidental exposure
- Encryption at rest: SSE-S3 vs SSE-KMS
- Encryption in transit: HTTPS-only (`aws:SecureTransport`)
- Versioning: rollback/recovery from overwrite/delete scenarios

#### Block Public Access
Prevents accidental public ACL or public bucket policy exposure — a common real-world breach pattern.

#### Default Encryption (SSE-S3)
Ensures new objects are encrypted at rest by default with minimal operational overhead.

#### Bucket policy enforcement
Default encryption alone doesn't prevent clients from uploading without encryption headers.
The policy enforces:
- HTTPS-only access
- Encryption is mandatory
- Only AES256 is accepted (baseline)

#### Versioning
Supports recovery patterns and protects against accidental overwrites/deletes.

### SAA-C03 notes
Expected scenarios:
- Default encryption vs policy enforcement is compared
- SSE-S3 vs SSE-KMS selection depends on governance/audit requirements
- Public exposure prevention includes BPA + policy + IAM least privilege
