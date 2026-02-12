### S3 Security Lab

This repository is part of my AWS Solutions Architect Associate (SAA-C03) – Build as I Learn journey.

The goal of this lab is to demonstrate secure-by-default Amazon S3 design, focusing on:
- Preventing public data exposure
- Enforcing encryption at rest
- Applying bucket-level security guardrails
- Understanding cost and lifecycle trade-offs

reinforces:
- Shared Responsibility Model
- Default-deny security posture
- Defense-in-depth using policies + service controls
- Architectural trade-offs rather than memorization

> Execution approach  

> For this lab, AWS CLI commands are grouped into `.sh` files to make the build
> process explicit and repeatable. This differs from my previous repositories,
> where commands were executed manually, and reflects a more structured, real-world
> cloud engineering workflow.

--

### Builds

#### 1 - `s3-secure-bucket-baseline/`

Secure-by-default bucket baseline and misconfiguration prevention.

Implemented controls:
- Block Public Access (bucket-level)
- Bucket policy enforcing HTTPS-only access
- Mandatory server-side encryption (SSE-S3)
- Versioning enabled
- Validation via CLI tests

#### 2 — `s3-lifecycle-and-cost/`

Storage class selection and cost-aware architecture decisions.

Covered:
- Lifecycle policies (Standard → IA → Glacier)
- Cost vs access trade-offs
- When NOT to use Glacier
- Exam-style decision logic

--

### Repository Structure

```text
AWS-S3-SECURITY-LAB/
├── README.md
├── s3-secure-bucket-baseline/
│   ├── README.md
│   ├── cli-commands/
│   ├── docs/
│   ├── evidence/
│   └── policy/
└── s3-lifecycle-and-cost/
    ├── README.md
    ├── cli-commands/
    ├── docs/
    ├── evidence/
    └── policy/