# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in LSM, please report it responsibly:

1. **Do not** open a public GitHub issue for security vulnerabilities
2. Email the maintainer at `hyperpolymath@protonmail.com` with:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact assessment
   - Any suggested fixes (optional)

**Response Timeline:**
- Initial response: within 48 hours
- Status update: within 7 days
- Resolution target: within 30 days for critical issues

## Security Measures

This project follows RSR (Rhodium Standard Repositories) security guidelines:

- SHA-pinned GitHub Actions to prevent supply chain attacks
- CodeQL and OSSF Scorecard security scanning
- Dependency auditing via `cargo audit`
- No hardcoded secrets (environment variables only)
- HTTPS-only for all external resources
- SHA256+ for any cryptographic operations (no MD5/SHA1)

## Scope

The following are in scope for security reports:
- Remote code execution vulnerabilities
- Memory safety issues in the Rust code
- Dependency vulnerabilities
- CI/CD pipeline security issues

Out of scope:
- Denial of service through excessive resource usage
- Issues in development dependencies only
